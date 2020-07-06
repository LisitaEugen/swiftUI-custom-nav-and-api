//
//  BeerDetailScreen.swift
//  SwiftUI-Custon-Nav-An-Api
//
//  Created by Evgheni Lisita on 06.07.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import SwiftUI

struct BeerDetailScreen: View {
    let beer: Beer?
    
    var body: some View {
        VStack(alignment: .leading) {
            FakeNavBar(label: "\(beer?.name ?? "" )")
            
            BeerDetail_GeneralInfo(beer: beer)
            .padding(.bottom)
            BeerDetail_Volumes(volume: beer?.volume, boilVolume: beer?.boilVolume)
            .padding(.bottom)
            BeerDetail_FoodPairing(foodPairing: beer?.foodPairing ?? [])
            .padding(.bottom)
            NavPushButton(destination: BeerMethodScreen(beer: beer)) {
                Text("Method")
            }
            NavPushButton(destination: BeerIngredientsScreen(beer: beer)) {
                Text("Ingredients")
            }
            
            Spacer()
        }
    .padding()
        
    }
}

struct BeerMethodScreen: View {
    let beer: Beer?
    
    var body: some View {
        VStack(alignment: .leading) {
            FakeNavBar(label: "\(beer?.name ?? "" )")
            Text("Method")
            Spacer()
        }
    }
}

struct BeerIngredientsScreen: View {
    let beer: Beer?
    
    var body: some View {
        VStack(alignment: .leading) {
            FakeNavBar(label: "\(beer?.name ?? "" )")
            Text("Ingredients")
            Spacer()
        }
    }
}

struct BeerDetail_GeneralInfo: View {
    let beer: Beer?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tagline: \(beer?.tagline ?? "")")
            Text("First brewed: \(beer?.firstBrewed ?? "")")
            Text("Description: \(beer?.description ?? "")")
            Text("Attenuation level: \(String(beer?.attenuationLevel ?? 0))")
            Text("Brewer's tips: \(beer?.brewersTips ?? "")")
            Text("Contributed by: \(beer?.contributedBy ?? "")")
        }
    }
}


struct BeerDetail_Volumes: View {
    let volume: ValueUnit?
    let boilVolume: ValueUnit?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Volume: \(String(volume?.value ?? 0)) \(volume?.unit ?? "")")
            Text("Boil volume: \(String(boilVolume?.value ?? 0)) \(boilVolume?.unit ?? "")")
        }
    }
    
}

struct BeerDetail_FoodPairing: View {
    let foodPairing: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Food pairing:")
            ForEach(foodPairing, id: \.self) { food in
                Text("\(food)")
            }
        }
    }
}

struct BeerDetailScreen_Previews: PreviewProvider {
    static let beer = Beer(id: 123, name: "Punk IPA 2007 - 2010", tagline: "Post Modern Classic. Spiky. Tropical. Hoppy.", firstBrewed: "04/2007", description: "Our flagship beer that kick started the craft beer revolution. This is James and Martin's original take on an American IPA.", imageUrl: "https://images.punkapi.com/v2/192.png", abv: 6.0, ibu: 60.0, targetFg: 1010.0, targetOg: 1056.0, ebc: 17.0, srm: 8.5, ph: 4.4, attenuationLevel: 82.14, brewersTips: "While it may surprise you, this version of Punk IPA isn't dry hopped but still packs a punch! To make the best of the aroma hops make sure they are fully submerged and add them just before knock out for an intense hop hit.", volume: ValueUnit(value: 20, unit: "liters"), boilVolume: ValueUnit(value: 25, unit: "liters"), foodPairing: [
      "Spicy carne asada with a pico de gallo sauce",
      "Shredded chicken tacos with a mango chilli lime salsa",
      "Cheesecake with a passion fruit swirl sauce"
        ], contributedBy: "Sam Mason <samjbmason>", method: BeerMethod(mashTemp: [MashTemp(temp: ValueUnit(value: 65, unit: "celsius"), duartion: 75)], fermentation: Fermentation(temp: ValueUnit(value: 19.0, unit: "celsius")), twist: nil), ingredients: BeerIngredients(malt: [Malt(name: "Extra Pale", amount: ValueUnit(value: 5.3, unit: "kilograms"))], hops: [Hope(name: "Ahtanum", amount: ValueUnit(value: 17.5, unit: "grams"), add: "start", attribute: "bitter"), Hope(name: "Chinook", amount: ValueUnit(value: 15, unit: "grams"), add: "start", attribute: "bitter")], yeast: "Wyeast 1056 - American Ale™"))
    
    static var previews: some View {
        BeerDetailScreen(beer: beer)
    }
}


/*

   "id": 192,
   "name": "Punk IPA 2007 - 2010",
   "tagline": "Post Modern Classic. Spiky. Tropical. Hoppy.",
   "first_brewed": "04/2007",
   "description": "Our flagship beer that kick started the craft beer revolution. This is James and Martin's original take on an American IPA, subverted with punchy New Zealand hops. Layered with new world hops to create an all-out riot of grapefruit, pineapple and lychee before a spiky, mouth-puckering bitter finish.",
   "image_url": "https://images.punkapi.com/v2/192.png",
   "abv": 6.0,
   "ibu": 60.0,
   "target_fg": 1010.0,
   "target_og": 1056.0,
   "ebc": 17.0,
   "srm": 8.5,
   "ph": 4.4,
   "attenuation_level": 82.14,
   "volume": {
     "value": 20,
     "unit": "liters"
   },
   "boil_volume": {
     "value": 25,
     "unit": "liters"
   },
   "method": {
     "mash_temp": [
       {
         "temp": {
           "value": 65,
           "unit": "celsius"
         },
         "duration": 75
       }
     ],
     "fermentation": {
       "temp": {
         "value": 19.0,
         "unit": "celsius"
       }
     },
     "twist": null
   },
   "ingredients": {
     "malt": [
       {
         "name": "Extra Pale",
         "amount": {
           "value": 5.3,
           "unit": "kilograms"
         }
       }
     ],
     "hops": [
       {
         "name": "Ahtanum",
         "amount": {
           "value": 17.5,
           "unit": "grams"
          },
          "add": "start",
          "attribute": "bitter"
        },
        {
          "name": "Chinook",
          "amount": {
            "value": 15,
            "unit": "grams"
          },
          "add": "start",
          "attribute": "bitter"
        },
        ...
     ],
     "yeast": "Wyeast 1056 - American Ale™"
   },
   "food_pairing": [
     "Spicy carne asada with a pico de gallo sauce",
     "Shredded chicken tacos with a mango chilli lime salsa",
     "Cheesecake with a passion fruit swirl sauce"
   ],
   "brewers_tips": "While it may surprise you, this version of Punk IPA isn't dry hopped but still packs a punch! To make the best of the aroma hops make sure they are fully submerged and add them just before knock out for an intense hop hit.",
   "contributed_by": "Sam Mason <samjbmason>"
 }
 **/
