//
//  ContentView.swift
//  TipCalculator
//
//  Created by Надежда on 2022-07-06.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeopleRow = 2
    @State private var tipPercentage = 0
    
    let tipPercentages = [0, 5, 10, 15, 20]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeopleRow + 2) //тк рассматриваем от 2х человек
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
        
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Tell me the details")) {
                    TextField("Еnter the total bill $", text: $checkAmount)
                    Picker("Number of people", selection: $numberOfPeopleRow) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(tipPercentages[$0])%")
                        }
                    } .pickerStyle(.segmented)
                }
                
                Section(header: Text("Per person including tips")) {
                    Text("\(totalPerPerson, specifier: "%.2f")$")
                }
            }
            .navigationTitle("Tip calculator")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
