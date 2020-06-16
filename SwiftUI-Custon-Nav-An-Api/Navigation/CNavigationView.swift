//
//  CNavigationView.swift
//  SwiftUI-Custon-Nav-An-Api
//
//  Created by Evgheni Lisita on 16.06.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import SwiftUI
import Combine

struct CNavigationView<Content>: View where Content: View {
    
    @ObservedObject private var viewModel: CNavigationViewModel
    
    private let content: Content
//    private let transition: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.viewModel = CNavigationViewModel()
        self.content = content()
    }
    
    var body: some View {
        let isRoot = viewModel.currentScreen == nil
        return ZStack {
                    if isRoot {
                        content.environmentObject(viewModel)
                    } else {
                        viewModel.currentScreen!.nextScreen.environmentObject(viewModel)
                    }
                }
    }
}

final class CNavigationViewModel: ObservableObject {
    fileprivate var currentScreen: Screen?
    
    private var screenStack = ScreenStack() {
        didSet {
            currentScreen = screenStack.top()
        }
    }
    
    func push<S: View>(_ screenView: S) {
        let screen = Screen(id: UUID().uuidString, nextScreen: AnyView(screenView))
        screenStack.push(screen)
    }
    
    func pop(to: PopDestination = .previous) {
        switch to {
        case .previous:
            screenStack.pop()
        case .root:
            screenStack.popToRoot()
        }
    }
}

private struct Screen: Identifiable, Equatable {
    var id: String
    let nextScreen: AnyView
    
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        lhs.id == rhs.id
    }
}

private struct ScreenStack {
    private var screens = [Screen]()
    
    func top() -> Screen? {
        screens.last
    }
    
    mutating func push(_ screen: Screen) {
        screens.append(screen)
    }
    
    mutating func pop() {
        _ = screens.popLast()
    }
    
    mutating func popToRoot() {
        screens.removeAll()
    }
}

// MARK: Nav UI

struct NavPushButton<Label, Destination>: View where Label: View, Destination: View {
    
    @EnvironmentObject private var navViewModel: CNavigationViewModel
    
    private let destination: Destination
    private let label: Label
    
    init(destination: Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        label.onTapGesture {
            self.push()
        }
    }
    
    private func push() {
        navViewModel.push(destination)
    }
}

struct NavPopButton<Label>: View where Label: View {
    
    @EnvironmentObject private var navViewModel: CNavigationViewModel
    
    private let destination: PopDestination
    private let label: Label
    
    init(destination: PopDestination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        label.onTapGesture {
            self.pop()
        }
    }
    
    private func pop() {
        navViewModel.pop(to: destination)
    }
}

enum PopDestination {
    case previous
    case root
}
