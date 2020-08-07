//
//  BeerMethodScreen.swift
//  SwiftUI-Custon-Nav-An-Api
//
//  Created by Evgheni Lisita on 12.07.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import SwiftUI
import PunkAPI

struct BeerMethodScreen: View {
    let beer: Beer?
    var method: BeerMethod?  {
        beer?.method
    }
    
    var body: some View {
        VStack {
            FakeNavBar(label: "\(beer?.name ?? "" ) Method")
            VStack(alignment: .leading) {
                Text("Fermentation temp: \(String(method?.fermentation?.temp?.value ?? 0)) \(method?.fermentation?.temp?.unit ?? "")")
                Text("Twist: \(method?.twist ?? "")")
                
                Spacer()
            }
            .padding()
        }
    }
}
struct BeerMethodScreen_Previews: PreviewProvider {
    static var previews: some View {
        BeerMethodScreen(beer: DataUtils.beerExample)
    }
}
