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
        CNavigationView(transition: .custom(.fadeAndMove, .moveAndFade)) {
            BeersListScreen()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
