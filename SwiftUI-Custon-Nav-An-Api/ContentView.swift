//
//  ContentView.swift
//  SwiftUI-Custon-Nav-An-Api
//
//  Created by Evgheni Lisita on 16.06.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CNavigationView(transition: .custom(.slide)) {
            FirstScreen()
        }
    }
}

struct FirstScreen: View {
    
    var body: some View {
        VStack(spacing: 20) {
            FakeNavBar(label: "First")
            Spacer()
            NavPushButton(destination: SecondScreen()){
                Text("To Second Screen")
                    .background(Color.yellow)
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
    }
    
}

struct SecondScreen: View {
    
    var body: some View {
        VStack(spacing: 20) {
            FakeNavBar(label: "Second")
            Spacer()
            NavPushButton(destination: ThirdScreen()){
                Text("To Third Screen")
                    .background(Color.yellow)
            }
            NavPopButton(destination: .previous){
                Text("Pop")
                    .background(Color.yellow)
            }
            Spacer()
        }
        .background(Color.green)
        .edgesIgnoringSafeArea(.top)
    }
    
}

struct ThirdScreen: View {
    
    var body: some View {
        VStack(spacing: 20) {
            FakeNavBar(label: "Third")
            Spacer()
            NavPopButton(destination: .previous){
                Text("Pop")
                    .background(Color.yellow)
            }
            NavPopButton(destination: .root){
                Text("Pop Root")
                    .background(Color.yellow)
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.top)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
