//
//  ContentView.swift
//  SearchablePicker
//
//  Created by Russell Gordon on 2022-05-07.
//

import SwiftUI

struct Province: Hashable {
    let name: String
    let combinedTaxRate: Double
    let taxDescription: String
}

struct ContentView: View {
    
    // MARK: Stored properties
    
    // What province was selected
    @State var pickerSelection: Province = Province(name: "Ontario",
                                                    combinedTaxRate: 0.13,
                                                    taxDescription: "HST")
    
    // List of provinces
    @State var provinces = [
        Province(name: "Alberta",
                 combinedTaxRate: 0.05,
                 taxDescription: "GST")
        ,
        Province(name: "Ontario",
                 combinedTaxRate: 0.13,
                 taxDescription: "HST")
        ,
        Province(name: "Quebec",
                 combinedTaxRate: 0.14975,
                 taxDescription: "QST+GST")
        ,

    ]
    
    
    // MARK: Computed properties
    var body: some View {
        NavigationView {
            
            Form {
                
                Section(content: {
                    Picker(selection: $pickerSelection,
                           label: Text("Province"),
                           content: {

                        ForEach(provinces, id: \.self) { currentProvince in
                            Text(currentProvince.name).tag(currentProvince)
                        }
                        
                    })
                    .pickerStyle(.automatic)
                }, header: {
                    Text("Select Jurisdiction")
                })
                
                Section(content: {
                    Text("\(pickerSelection.taxDescription): \(pickerSelection.combinedTaxRate * 100) %")
                }, header: {
                    Text("Applied Tax Rate")
                })
                
                
            }
            .navigationTitle("Tax Calculator")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
