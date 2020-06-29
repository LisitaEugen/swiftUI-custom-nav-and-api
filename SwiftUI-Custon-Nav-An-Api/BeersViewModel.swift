//
//  BeersViewModel.swift
//  SwiftUI-Custon-Nav-An-Api
//
//  Created by Evgheni Lisita on 27.06.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import Foundation

extension Beer: Identifiable {        
}

class BeersViewModel: ObservableObject {
    @Published private(set) var beers = [Beer]()
    
    @Published private(set) var isPageLoading = false
    @Published private(set) var page: Int = 0
    
    func fetchPage() {
        guard isPageLoading == false else {
            return
        }
        page += 1
        isPageLoading = true
        
        BeersAPI.beersGet(page: page, perPage: 20) { data, error in
            self.isPageLoading = false
            if let beersList = data {
                self.beers.append(contentsOf: beersList)
            } else {
                print(error ?? "no error")
            }
        }
    }
}
