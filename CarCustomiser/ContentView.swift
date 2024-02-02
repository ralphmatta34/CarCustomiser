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
    @State private var remainingTime = 30
    @State private var nextButtonDisabled: Bool = false
    
    var exhaustPackageEnabled: Bool {
        return exhaustPackage ? true : remainingFunds >= 500 ? true : false
    }
    
    var tiresPackageEnabled: Bool {
        return tiresPackage ? true : remainingFunds >= 500 ? true : false
    }
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
            Text("\(remainingTime)")
                .onReceive(timer, perform: { _ in
                    if self.remainingTime > 0 {
                        self.remainingTime -= 1
                    } else {
                        nextButtonDisabled = true
                    }
                })
                .foregroundColor(.red)
            Form {
                VStack(alignment: .leading, spacing: 20) {
                    Text(starterCars.cars[selectedCar].displayStats())
                    
                    Button("Next Car", action: {
                        
                        exhaustPackage = false
                        tiresPackage = false
                        
                        if selectedCar == starterCars.cars.count-1 {
                            selectedCar = 0
                            
                        } else {
                            selectedCar += 1
                        }
                        
                        remainingFunds = 750
                        
                    })
                    .disabled(nextButtonDisabled)
                }
                    
                Section {
                        
                    Toggle("Exhaust Package (500)", isOn: exhaustPackageBinding)
                        .disabled((remainingFunds < 500 && !exhaustPackage) || nextButtonDisabled)
                        
                    Toggle("Tires Package (500)", isOn: tiresPackageBinding)
                        .disabled((remainingFunds < 500 && !tiresPackage) || nextButtonDisabled)
         
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

