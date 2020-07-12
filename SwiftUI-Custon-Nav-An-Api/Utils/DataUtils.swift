//
//  DataUtils.swift
//  SwiftUI-Custon-Nav-An-Api
//
//  Created by Evgheni Lisita on 12.07.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import Foundation

struct DataUtils {
    static let beerExample = Beer(id: 123, name: "Punk IPA 2007 - 2010", tagline: "Post Modern Classic. Spiky. Tropical. Hoppy.", firstBrewed: "04/2007", description: "Our flagship beer that kick started the craft beer revolution. This is James and Martin's original take on an American IPA.", imageUrl: "https://images.punkapi.com/v2/192.png", abv: 6.0, ibu: 60.0, targetFg: 1010.0, targetOg: 1056.0, ebc: 17.0, srm: 8.5, ph: 4.4, attenuationLevel: 82.14, brewersTips: "While it may surprise you, this version of Punk IPA isn't dry hopped but still packs a punch! To make the best of the aroma hops make sure they are fully submerged and add them just before knock out for an intense hop hit.", volume: ValueUnit(value: 20, unit: "liters"), boilVolume: ValueUnit(value: 25, unit: "liters"), foodPairing: [
    "Spicy carne asada with a pico de gallo sauce",
    "Shredded chicken tacos with a mango chilli lime salsa",
    "Cheesecake with a passion fruit swirl sauce"
      ], contributedBy: "Sam Mason <samjbmason>", method: BeerMethod(mashTemp: [MashTemp(temp: ValueUnit(value: 65, unit: "celsius"), duartion: 75)], fermentation: Fermentation(temp: ValueUnit(value: 19.0, unit: "celsius")), twist: nil), ingredients: BeerIngredients(malt: [Malt(name: "Extra Pale", amount: ValueUnit(value: 5.3, unit: "kilograms"))], hops: [Hope(name: "Ahtanum", amount: ValueUnit(value: 17.5, unit: "grams"), add: "start", attribute: "bitter"), Hope(name: "Chinook", amount: ValueUnit(value: 15, unit: "grams"), add: "start", attribute: "bitter")], yeast: "Wyeast 1056 - American Ale™"))
}


