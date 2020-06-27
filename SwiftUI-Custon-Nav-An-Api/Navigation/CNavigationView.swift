//
//  CNavigationView.swift
//  SwiftUI-Custon-Nav-An-Api
//
//  Created by Evgheni Lisita on 16.06.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import SwiftUI
import Combine

extension AnyTransition {

    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading).combined(with: .opacity)
        let removal = AnyTransition.scale.combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }

}

struct CNavigationView<Content>: View where Content: View {
    
    @ObservedObject private var viewModel: NavControllerViewModel
    
    private let content: Content
    private let transition: (push: AnyTransition, pop: AnyTransition)
    
    init(transition: NavTransiton, easing: Animation = .easeOut(duration: 2.5), @ViewBuilder content: @escaping () -> Content) {
        self.viewModel = NavControllerViewModel(easing: easing)
        self.content = content()
        switch transition {
        case .custom(let transition):
            self.transition = (transition, transition)
        case .none:
            self.transition = (.identity, .identity)
        }
    }
    
    var body: some View {
        let isRoot = viewModel.currentScreen == nil
        return ZStack {
            if isRoot {
                content
                    .environmentObject(viewModel)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            } else {
                viewModel.currentScreen!.nextScreen
                    .environmentObject(viewModel)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            }
        }
    }
    
}


// NavigationLink analogue
struct NavPushButton<Label, Destination>: View where Label: View, Destination: View {
    
    @EnvironmentObject private var viewModel: NavControllerViewModel
    
    private let destination: Destination
    private let label: Label
    
    init(destination: Destination, @ViewBuilder label: @escaping () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        label.onTapGesture {
            self.push()
        }
    }
    
    private func push() {
        viewModel.push(destination)
    }

}

// analogue of @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
struct NavPopButton<Label>: View where Label: View {
    
    @EnvironmentObject private var viewModel: NavControllerViewModel
    
    private let destination: PopDestination
    private let label: Label
    
    init(destination: PopDestination = .previous, @ViewBuilder label: @escaping () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        label.onTapGesture {
            self.pop()
        }
    }
    
    private func pop() {
        viewModel.pop(to: destination)
    }
}




// MARK: - Structs & Enums

private struct Screen: Identifiable, Equatable {
    
    let id: String
    let nextScreen: AnyView
    
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        lhs.id == rhs.id
    }
}

enum NavTransiton {
    case none
    case custom(AnyTransition)
}

enum NavType {
    case push
    case pop
}

enum PopDestination {
    case previous
    case root
}

// MARK: - Logic

final class NavControllerViewModel: ObservableObject {
    
    private let easing: Animation
    
    var navigationType = NavType.push
    
    @Published fileprivate var currentScreen: Screen?
    
    private var screenStack = ScreenStack() {
        didSet {
            currentScreen = screenStack.top()
        }
    }
    
    // Init
    
    init(easing: Animation) {
        self.easing = easing
    }
    
    // API
    
    func push<S: View>(_ screenView: S) {
        withAnimation(easing) {
            navigationType = .push
            let screen = Screen(
                id: UUID().uuidString,
                nextScreen: AnyView(screenView)
            )
            screenStack.push(screen)
        }
    }
    
    func pop(to: PopDestination = .previous) {
        withAnimation(easing) {
            navigationType = .pop
            switch to {
            case .root:
                screenStack.popToRoot()
            case .previous:
                screenStack.popToPrevious()
            }
        }
    }
    
    // Nested Stack Model
    
    private struct ScreenStack {
        
        private var screens = [Screen]()
        
        func top() -> Screen? {
            screens.last
        }
        
        mutating func push(_ s: Screen) {
            screens.append(s)
        }
        
        mutating func popToPrevious() {
            _ = screens.popLast()
        }
        
        mutating func popToRoot() {
            screens.removeAll()
        }
    }
    
}

// MARK: - NavBar

extension UIApplication {
    /// The app's key window taking into consideration apps that support multiple scenes.
    var keyWindowInConnectedScenes: UIWindow? {
        return windows.first(where: { $0.isKeyWindow })
    }
}

extension UIDevice {
    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindowInConnectedScenes?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}

struct FakeNavBar: View {
    
    @EnvironmentObject private var viewModel: NavControllerViewModel
    
    let label: String
    //let backAction: ()->Void
    
    var body: some View {
        ZStack {
            HStack {
                if viewModel.currentScreen != nil {
                    backView
                    .simultaneousGesture(TapGesture()
                        .onEnded {
                            self.viewModel.pop(to: .previous)
                            //self.backAction()
                        }
                    )
                    .padding(.top, UIDevice.current.hasNotch ? 40 : 20)
                }
                Spacer()
            }
            .frame(height: UIDevice.current.hasNotch ? 84 : 64)
            .frame(maxWidth: .infinity)
            .background(Color("BackgroundMain"))
            .compositingGroup()
            .shadow(color: Color("BackgroundMain").opacity(0.2), radius: 0, x: 0, y: 2)
            Text(label)
                .foregroundColor(.primary)
                .font(Font.body.weight(.bold))
                .padding(.top, UIDevice.current.hasNotch ? 40 : 20)
        }
    }
    
    var backView: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .opacity(0.02)
                .frame(width: 60, height: 60)
                .allowsHitTesting(false)
            HStack {
                Spacer()
                Image(systemName: "chevron.left")
                    .font(Font.system(size: 20).weight(.semibold))
                    .foregroundColor(.primary)
                Spacer()
            }
            .frame(width: 50, height: 50)
            .contentShape(Rectangle())
        }
    }
    
}
