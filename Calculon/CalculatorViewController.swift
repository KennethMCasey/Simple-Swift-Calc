//
//  CalculatorViewController.swift
//  Calculon
//
//  Created by David Gerstl on 2/19/19.
//  Copyright © 2019 Farmingdale State College. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    let myModel = CalculatorModel()
    @IBOutlet weak var calculatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorLabel.adjustsFontSizeToFitWidth = true

        // Do any additional setup after loading the view.
    }
    // MARK: - Controller code
    
    @IBAction func numberPressed(_ sender: Any) {
        if let theButton = sender as? UIButton {
            let buttonLabel = theButton.titleLabel?.text!
            let theNumber = Int(buttonLabel!)!
            myModel.numberPressed(number: theNumber)
        }
        calculatorLabel.text = myModel.numberToDisplay
    }
    
    
    @IBAction func decimalPointPressed() {
        myModel.decimalPointPressed()
        calculatorLabel.text = myModel.numberToDisplay
    }
    @IBAction func clearPressed() {
        myModel.clear()
        calculatorLabel.text = myModel.numberToDisplay
    }
    @IBAction func operationPressed(_ sender: Any) {
        if let theButton = sender as? UIButton {
            var theOperation = CalculatorModel.Operations.equals
            let buttonLabel = theButton.titleLabel?.text!
            if (buttonLabel == "+") {
                theOperation = .plus
            } else if (buttonLabel == "-"){
                theOperation = .minus
            }
            myModel.operationPressed(operation: theOperation)
        }
        calculatorLabel.text = myModel.numberToDisplay
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
