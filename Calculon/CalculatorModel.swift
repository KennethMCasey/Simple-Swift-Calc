//
//  CalculatorModel.swift
//  Calculon
//
//  Created by David Gerstl on 2/14/19.
//  Copyright © 2019 Farmingdale State College. All rights reserved.
//

import Foundation


class CalculatorModel {
    enum Operations {
        case plus
        case minus
        case equals
    }
    var numberToDisplay: String? = "0.0"
    var operationInProgress = Operations.equals
    var previousNumber = 0.0
    var numberJustPressed = false
    
    init() {
        // put something here????
    }
    func numberPressed(number: Int) {
        // let dNumber = Double(number)
        // write me later
        if numberJustPressed {
            numberToDisplay = numberToDisplay! + String(number)
        } else {
            numberToDisplay = String(number)
        }
        numberJustPressed = true
    }
    func decimalPointPressed(){
        // write me later
        // make sure to test if there already is a "."
        if (!(numberToDisplay?.contains("."))!) {
            numberToDisplay = numberToDisplay! + "."
        }
    }
    private func hasDec(numberToCheck: Double)->Bool {
        return (numberToCheck != floor(numberToCheck))
    }
    
    func operationPressed(operation: Operations) {
        // execute the prior operation if there is one
        let displayDouble = Double(numberToDisplay!)!
        switch (operationInProgress) {
        case .plus:
            previousNumber = previousNumber + displayDouble
        case .minus:
            previousNumber = previousNumber - displayDouble
        case .equals:
            previousNumber = displayDouble
        }
        // copy the result into numberToDisplay and previousNumber
        if ((numberToDisplay?.contains("."))! || hasDec(numberToCheck: previousNumber)){
            // Keep the .
            numberToDisplay = String(previousNumber)
        } else {
            // drop the .
            let pnInt = Int(previousNumber)
            numberToDisplay = String(pnInt)
        }
        // reset operationInProgress
        operationInProgress = operation
        numberJustPressed = false
    }
    

    func clear() {
        numberToDisplay = "0.0"
        operationInProgress = .equals
        previousNumber = 0.0
        numberJustPressed = false
    }
    
}
