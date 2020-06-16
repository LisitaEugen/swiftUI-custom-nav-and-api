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
        CNavigationView {
            NumberedScreen(number: 0)
        }
    }
}

struct NumberedScreen: View {
    var number: Int
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(number) Screen")
            Spacer()
            NavPushButton(destination: NumberedScreen(number: number + 1)) {
                Text("Navigate to the next screen ->")
            }
            Spacer()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
