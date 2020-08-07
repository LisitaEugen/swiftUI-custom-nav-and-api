//
//  BeerDetailScreen.swift
//  SwiftUI-Custon-Nav-An-Api
//
//  Created by Evgheni Lisita on 06.07.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import SwiftUI
import PunkAPI

struct BeerDetailScreen: View {
    let beer: Beer?
    
    var body: some View {
        VStack {
            FakeNavBar(label: "\(beer?.name ?? "" )")
            VStack(alignment: .leading) {
                BeerDetail_GeneralInfo(beer: beer)
                .padding(.bottom)
                BeerDetail_Volumes(volume: beer?.volume, boilVolume: beer?.boilVolume)
                .padding(.bottom)
                BeerDetail_FoodPairing(foodPairing: beer?.foodPairing ?? [])
                .padding(.bottom)
                NavPushButton(destination: BeerMethodScreen(beer: beer)) {
                    Text("Method")
                        .fontWeight(.bold)
                }
                .padding()
                NavPushButton(destination: BeerIngredientsScreen(beer: beer)) {
                    Text("Ingredients")
                    .fontWeight(.bold)
                }
                .padding()
                
                Spacer()
            }
            .padding()
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
    static var previews: some View {
        BeerDetailScreen(beer: DataUtils.beerExample)
    }
}
