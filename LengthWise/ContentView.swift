//
//  ContentView.swift
//  LengthWise
//
//  Created by Tim Marquardt on 13.11.20.
//  Copyright © 2020 Tim Marquardt. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @State private var inNumber = ""
    @State private var inUnit = 0
    @State private var outUnit = 2
    
    let units = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    
    // computed property that returns the converted unit
    var convertedUnit: Double {
        let numberIn = Double(inNumber) ?? 0
        let conversionIn = units[inUnit]
        let conversionOut = units[outUnit]
        var unitIn = Measurement(value: 1.0, unit: UnitLength.meters)
        
        
        switch conversionIn { //converts Input String to correct unit
            case "Meters":
                unitIn = Measurement(value: numberIn, unit: UnitLength.meters)
            case "Kilometers":
                unitIn = Measurement(value: numberIn, unit: UnitLength.kilometers)
            case "Feet":
                unitIn = Measurement(value: numberIn, unit: UnitLength.feet)
            case "Yards":
                unitIn = Measurement(value: numberIn, unit: UnitLength.yards)
            case "Miles":
                unitIn = Measurement(value: numberIn, unit: UnitLength.miles)
            default:
                unitIn = Measurement(value: numberIn, unit: UnitLength.meters)
        }
        
        let toMM = unitIn.converted(to: UnitLength.millimeters) //converts Input unit to Millimeters as intermediary
        
        switch conversionOut { //converts intermediary to specified output unit, returns result
            case "Meters":
                let resultMes = toMM.converted(to: UnitLength.meters)
                let result = resultMes.value
                return result
            case "Kilometers":
                let resultMes = toMM.converted(to: UnitLength.kilometers)
                let result = resultMes.value
                return result
            case "Feet":
                let resultMes = toMM.converted(to: UnitLength.feet)
                let result = resultMes.value
                return result
            case "Yards":
                let resultMes = toMM.converted(to: UnitLength.yards)
                let result = resultMes.value
                return result
            case "Miles":
                let resultMes = toMM.converted(to: UnitLength.miles)
                let result = resultMes.value
                return result
            default:
                unitIn = Measurement(value: numberIn, unit: UnitLength.meters)
                return 0
        }
        
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter Length")) {
                    TextField("Length", text: $inNumber)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Choose input unit")) {
                    Picker("Input Unit", selection:
                    $inUnit){
                        ForEach(0..<units.count){
                            Text("\(self.units[$0])")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Choose output unit")) {
                    Picker("Output Unit", selection:
                    $outUnit){
                        ForEach(0..<units.count){
                            Text("\(self.units[$0])")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Converted")) {
                    Text("\(convertedUnit, specifier: "%.2f") \(units[outUnit])")
                }
            }
            .navigationBarTitle("LenghtWise")
        }
    }
    
}
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
