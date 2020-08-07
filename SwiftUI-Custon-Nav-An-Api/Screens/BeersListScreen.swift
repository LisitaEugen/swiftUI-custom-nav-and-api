//
//  BeersListScreen.swift
//  SwiftUI-Custon-Nav-An-Api
//
//  Created by Evgheni Lisita on 27.06.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import SwiftUI
import PunkAPI

struct BeersListScreen: View {

    @EnvironmentObject var viewModel: BeersViewModel
    
    var body: some View {
        VStack {
            BeersListScreen_List()
        }.onAppear() {
            self.viewModel.fetchPage()
        }
    }
}

struct BeersListScreen_List: View {
    @EnvironmentObject var viewModel: BeersViewModel
     
    var body: some View {
        VStack {
            Picker(selection: $viewModel.apiMode, label: Text("Choose a beer of your taste")) {
                Text("ABV > 10").tag(0)
                Text("IBU > 20").tag(1)
                Text("EBC > 30").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            List(self.viewModel.beers) { beer in
                BeersListScreen_Cell(beer: beer).onAppear() {
                    if self.viewModel.beers.isLast(beer) {
                        self.viewModel.fetchPage()
                    }
                }
            }
        }
        
    }
}

struct BeersListScreen_Cell: View {
    var beer: Beer?
    var body: some View {
        NavPushButton(destination: BeerDetailScreen(beer: beer)) {
            Text("\(self.beer?.name ?? "")")
        }
    }
}



struct BeersListScreen_Previews: PreviewProvider {
    static var previews: some View {
        BeersListScreen()
    }
}
