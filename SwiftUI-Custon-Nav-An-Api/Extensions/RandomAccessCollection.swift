//
//  RandomAccessCollection.swift
//  SwiftUI-Custon-Nav-An-Api
//
//  Created by Evgheni Lisita on 29.06.20.
//  Copyright © 2020 Evgheni Lisita. All rights reserved.
//

import Foundation

extension RandomAccessCollection where Self.Element: Identifiable {
    
    func isLast(_ item: Element) -> Bool {
        guard isEmpty == false else {
            return false
        }
        
        guard let itemIndex = lastIndex(where: {
            $0.id == item.id
        }) else {
            return false
        }
        
        return distance(from: itemIndex, to: endIndex) == 1
    }
}
