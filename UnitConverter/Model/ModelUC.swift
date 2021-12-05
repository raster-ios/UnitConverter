//
//  ModelUC.swift
//  UnitConverter
//
//  Created by Gena Raster on 2.12.21.
//

import Foundation


struct ModelUC {
    
    private (set) var unitArray: Array<Units>
    
    
    init(dict: [String: Array<ContentUnit>]) {
        unitArray = Array<Units>()
        for (name, value) in dict {
            unitArray.append(Units(name: name,
                                   content: value))
        }
    }
    
    struct Units: Identifiable {
        var id = UUID()
        let name: String
        let content: Array <ContentUnit>
    }
    
    struct ContentUnit: Identifiable {
        var id = UUID()
        let name: String
        var value: Double = 0
        
    }
    
}
