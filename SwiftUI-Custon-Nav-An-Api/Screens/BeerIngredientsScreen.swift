//
//  BeerIngredientsScreen.swift
//  SwiftUI-Custon-Nav-An-Api
//
//  Created by Evgheni Lisita on 12.07.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import SwiftUI

struct BeerIngredientsScreen: View {
    let beer: Beer?
    var ingredients: BeerIngredients? {
        beer?.ingredients
    }
    
    var body: some View {
        VStack {
            FakeNavBar(label: "\(beer?.name ?? "" )")
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Malt:").fontWeight(.bold)
                    ForEach(ingredients?.malt ?? [], id: \.name) { malt in
                        Text("\(malt.name ?? ""): \(String(malt.amount?.value ?? 0)) \(malt.amount?.unit ?? "")")
                        .padding()
                    }
                    Text("Hops:").fontWeight(.bold)
                    ForEach(ingredients?.hops ?? [], id: \.name) { hope in
                        VStack(alignment: .leading) {
                            Text("\(hope.name ?? ""): \(String(hope.amount?.value ?? 0)) \(hope.amount?.unit ?? "")")
                            Text("Add: \(hope.add ?? "")")
                            Text("Attribute: \(hope.add ?? "")")
                        }.padding()
                    }
                    Spacer()
                }.padding()
            }
        }
    }
}

struct BeerIngredientsScreen_Previews: PreviewProvider {
    static var previews: some View {
        BeerIngredientsScreen(beer: DataUtils.beerExample)
    }
}
