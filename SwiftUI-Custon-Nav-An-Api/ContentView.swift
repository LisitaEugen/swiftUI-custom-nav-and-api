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
            BeersListScreen()
        }
    }
}

struct First: View {
    var body: some View {
        VStack {
            FakeNavBar(label: "First")
            Spacer()
            NavPushButton(destination: Second()) {
               Text("To second")
            }
            Spacer()
        }
    }
}

struct Second: View {
    var body: some View {
       VStack {
            FakeNavBar(label: "Second")
            Spacer()
            NavPushButton(destination: Third()) {
               Text("To third")
            }
            Spacer()
            NavPopButton() {
               Text("To first")
            }
        }
    }
}

struct Third: View {
    var body: some View {
        VStack {
            FakeNavBar(label: "Third")
            Spacer()
            NavPopButton() {
               Text("To second")
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
