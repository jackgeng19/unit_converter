//
//  ContentView.swift
//  UnitConverters
//
//  Created by Qicheng Geng on 2/21/23.
//

import SwiftUI

struct ContentView: View {

    @State private var input = 0.0
    @State private var initUnit = "Liters"
    @State private var finalUnit = "Gallons"
    @FocusState private var amountIs: Bool
    
    let inputUnits = ["mL", "Liters", "Cup", "Pints", "Gallons"]
    let outputUnits = ["mL", "Liters", "Cup", "Pints", "Gallons"]

    
    var totalper: Double{
//        let peopleCount = Double(numberOfPeople + 2)
        
        return 0.0
    }
    
    var output: String {
        let inputMultiplier: Double
        let LiterToOutputMultiplier: Double

        switch initUnit {
        case "mL":
            inputMultiplier = 1000
        case "Gallons":
            inputMultiplier = 3.7854
        case "Cup":
            inputMultiplier = 0.24
        case "Pints":
            inputMultiplier = 0.473
        default:
            inputMultiplier = 1.0
        }

        switch finalUnit {
        case "mL":
            LiterToOutputMultiplier = 1000
        case "Liters":
            LiterToOutputMultiplier = 1.0
        case "Cup":
            LiterToOutputMultiplier = 4.16667
        case "Pints":
            LiterToOutputMultiplier = 2.11338
        default:
            LiterToOutputMultiplier = 3.7854
        }

        let inputInLiter = input * inputMultiplier
        let output = inputInLiter * LiterToOutputMultiplier

        let outputString = output.formatted()
        return "\(outputString) \(finalUnit.lowercased())"
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIs)
                    Picker("InputUnit", selection: $initUnit) {
                        ForEach(inputUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input Value and Unit")
                }
                
                Section {
                    Picker("OutputUnit", selection: $finalUnit) {
                        ForEach(outputUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Output Unit")
                }
            
                Section{
                    Text(output)
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("Volume Conversion")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    
                    Button("Done"){
                        amountIs = false
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
