//
//  ContentView.swift
//  TipCalculator
//
//  Created by Kevin Wafula on 02/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var total: String = ""
    @State private var tipPercentage: Double = 0.2
    @State private var tip: String?
    @State private var message: String = ""
    private let tipCalculator = TipCalculator()
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                TextField("Enter Total", text: $total)
                    .textFieldStyle(.roundedBorder)
                    .accessibilityIdentifier("totalTextField")
                
                Picker(selection: $tipPercentage) {
                    Text("10%").tag(0.1)
                    Text("20%").tag(0.2)
                    Text("30%").tag(0.3)
                } label: {
                    EmptyView() }
                .pickerStyle(.segmented)
                .accessibilityIdentifier("tipPercentageSegmentControl")
                
                Button{
                    
                    message = ""
                    tip = ""
                    
                    guard let total = Double(self.total) else {
                        message = "Invalid Input"
                        return
                    }
                    
                    do {
                        let result = try tipCalculator.calculate(total: total, tipPercentage: tipPercentage)
                        
                        let formatter = NumberFormatter()
                        formatter.numberStyle = .currency
                        
                        tip = formatter.string(from: NSNumber(value: result))
                        
                        
                    } catch TipCalculatorError.invalidInput {
                        message = "Invalid Input"
                    } catch {
                        message = error.localizedDescription
                    }
                    
                    
                    
                } label: {
                    Text("Calculate Tip").accessibilityIdentifier("calculateTipButton")
                    
                }.padding(.top, 20)
                    
                
                Text(message).padding(.top, 50).accessibilityIdentifier("messageText")
                
                Spacer()
                
                Text(tip ?? "").font(.system(size: 54)).accessibilityIdentifier("tipText")
                
                Spacer().navigationTitle("Tip Calculator")
                
            }.padding()
        }
    }
}

#Preview {
    ContentView()
}
