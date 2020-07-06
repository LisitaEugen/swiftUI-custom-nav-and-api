//
//  BeersListScreen.swift
//  SwiftUI-Custon-Nav-An-Api
//
//  Created by Evgheni Lisita on 27.06.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import SwiftUI

struct BeersListScreen: View {

    @EnvironmentObject var viewModel: BeersViewModel
    
    var body: some View {
        VStack {
            BeersListScreen_List()
        }.onAppear() {
            self.viewModel.fetchPage() // first page
        }
    }
}

struct BeersListScreen_List: View {
    
    @EnvironmentObject var viewModel: BeersViewModel
    
    var body: some View {
        List(self.viewModel.beers) { beer in
            
            BeersListScreen_Cell(name: beer.name).onAppear() {
                if self.viewModel.beers.isLast(beer) {
                    self.viewModel.fetchPage()
                }
            }
        }
    }
}

struct BeersListScreen_Cell: View {
    var name: String?
    var body: some View {
        Text("\(name ?? "")")
    }
}



struct BeersListScreen_Previews: PreviewProvider {
    static var previews: some View {
        BeersListScreen()
    }
}
