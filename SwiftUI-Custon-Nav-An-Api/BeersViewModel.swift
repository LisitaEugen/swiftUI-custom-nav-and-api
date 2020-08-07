//
//  BeersViewModel.swift
//  SwiftUI-Custon-Nav-An-Api
//
//  Created by Evgheni Lisita on 27.06.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import Foundation
import PunkAPI

extension Beer: Identifiable {        
}

class BeersViewModel: ObservableObject {
    enum RequestMode {
        case ABV(value: Int)
        case IBU(value: Int)
        case EBC(value: Int)
    }
    
    @Published private(set) var beers = [Beer]()
    
    @Published private(set) var isPageLoading = false
    @Published private(set) var page: Int = 0
    @Published var apiMode: Int = 0 {
        didSet {
            switch apiMode {
            case 0:
                requestMode = .ABV(value: 10)
            case 1:
                requestMode = .IBU(value: 20)
            case 2:
                requestMode = .EBC(value: 30)
            default:
                requestMode = .ABV(value: 10)
            }
        }
    }
    
    var requestMode: RequestMode = .ABV(value: 10) {
        didSet {
            page = 0
            beers = []
            fetchPage()
        }
    }
    
    func fetchPage() {
        guard isPageLoading == false else {
            return
        }
        page += 1
        isPageLoading = true
        
        switch requestMode {
        case .ABV(let value):
            BeersAPI.getBeers(page: page, perPage: 20, abvGt: value, completion: handleResult(_:_:))
        case .IBU(let value):
            BeersAPI.getBeers(page: page, perPage: 20, ibuGt: value, completion: handleResult(_:_:))
        case .EBC(let value):
            BeersAPI.getBeers(page: page, perPage: 20, ebcGt: value, completion: handleResult(_:_:))
        }
    }
    
    private func handleResult(_ data: [Beer]?,_ error: Error?) -> Void {
        self.isPageLoading = false
        if let beersList = data {
            self.beers.append(contentsOf: beersList)
        } else {
            print(error ?? "no error")
        }
    }
}
