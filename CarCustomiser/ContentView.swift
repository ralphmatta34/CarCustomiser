//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Ralph Matta on 12/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int = 0
    
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    
    @State private var remainingFunds: Int = 750
    
    @State private var justChanged: Bool = false
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue && self.remainingFunds >= 500 {
                    starterCars.cars[selectedCar].topSpeed += 5
                    self.remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    self.remainingFunds += 500
                }
            }
        )
        
        let tiresPackageBinding = Binding<Bool> (
            get: { self.tiresPackage },
            set: { newValue in
                self.tiresPackage = newValue
                if newValue && self.remainingFunds >= 500 {
                    starterCars.cars[selectedCar].handling += 2
                    self.remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                    self.remainingFunds += 500
                }
            }
        )
    
        VStack {
            Form {
                VStack(alignment: .leading, spacing: 20) {
                    Text(starterCars.cars[selectedCar].displayStats())
                    
                    Button("Next Car", action: {
                        
                        exhaustPackage = false
                        tiresPackage = false
                        justChanged = true
                        
                        if selectedCar == starterCars.cars.count-1 {
                            selectedCar = 0
                            
                        } else {
                            selectedCar += 1
                        }
                        
                        if exhaustPackage || tiresPackage {
                            justChanged = false
                        }
                        
                    })
                }
                    
                Section {
                        
                    Toggle("Exhaust Package (500)", isOn: exhaustPackageBinding)
                        .disabled(self.remainingFunds < 500 && !exhaustPackage && !justChanged)
                        
                    Toggle("Tires Package (500)", isOn: tiresPackageBinding)
                        .disabled(self.remainingFunds < 500 && !tiresPackage && !justChanged)
         
                }
                
            }
            
            Text("Remaining Funds: \(self.remainingFunds)")
                .foregroundColor(.red)
                .baselineOffset(20)
        }
    }
}

#Preview {
    ContentView()
}

