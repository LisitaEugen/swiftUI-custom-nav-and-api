//
//  BeersListScreen.swift
//  SwiftUI-Custon-Nav-An-Api
//
//  Created by Evgheni Lisita on 27.06.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import SwiftUI

struct BeersListScreen: View {
    var body: some View {
        List(1...20, id: \.self) { number in
            Text("Number \(number)")
        }
    }
}

struct BeersListScreen_Previews: PreviewProvider {
    static var previews: some View {
        BeersListScreen()
    }
}
