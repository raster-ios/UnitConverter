//
//  ContentView.swift
//  UnitConverter
//
//  Created by Gena Raster on 2.12.21.
//

import SwiftUI

struct ContentView: View {
    
    enum Items: String, CaseIterable {
    case lenghth, temp, volume
    }
    
    func getItemsArray () -> [String] {
        var arr = [String]()
        for item in Items.allCases {
            arr.append(item.rawValue)
        }
        return arr
    }
    
    @State private var choosenItem = Items.temp.rawValue
    
    @State private var incomingValue: Double = 0
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                Section (header: Text("Choose some unit:")) {
                    Picker("Items", selection: $choosenItem) {
                        ForEach(getItemsArray(), id: \.self) {
                            Text($0.uppercased())
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                HStack {
                    TextField("Value", value: $incomingValue,
                              format: .number,
                              prompt: Text("Enter a value"))
                        .padding()
                }
                
                Spacer()
    
            }
            .padding()
            .navigationTitle("Unit Converter")
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
