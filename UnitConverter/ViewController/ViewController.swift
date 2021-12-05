//
//  ViewController.swift
//  UnitConverter
//
//  Created by Gena Raster on 5.12.21.
//

import Foundation

class ViewController: ObservableObject {
    typealias ContentUnit = ModelUC.ContentUnit
    typealias Units = ModelUC.Units
    
    static private var temperatureArray = ["Celsius", "Kelvin", "Fahrenheit"]
    static private var lengthArray = ["meters", "kilometers", "feet", "yards"]
    static private var volumeArray = ["liters", "cups", "pints", "gallons"]
    
    static func getNamesArr (_ nameArray: Array<String>) -> Array<ContentUnit> {
        var arr = Array<ContentUnit>()
        for name in nameArray {
            arr.append(ContentUnit(name: name))
        }
        return arr
    }
    
    static let unitNamesArray: [String: [ContentUnit]] = [
        "Temperature": getNamesArr(temperatureArray),
        "Length": getNamesArr(lengthArray),
        "Volume": getNamesArr(volumeArray)
    ]
    
   static func createConverter () -> ModelUC {
        ModelUC(dict: unitNamesArray)
    }
    
    @Published private (set) var model = createConverter()
    
    var units: Array<Units> {
        model.unitArray
    }
}
