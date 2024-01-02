//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by Kevin Wafula on 02/01/2024.
//

import Foundation

enum TipCalculatorError: Error {
    case invalidInput
}

class TipCalculator {
    
    func calculate(total: Double, tipPercentage: Double) throws -> Double {
        
        if total < 0 {
            throw TipCalculatorError.invalidInput
        }
        
        return total * tipPercentage
    }
}
