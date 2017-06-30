//
//  ViewController.swift
//  MesinKira
//
//  Created by Ahmad Fairiz on 29/06/2017.
//  Copyright © 2017 Recite Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var display: UILabel!
  
  var userIsInTheMiddleOfTyping = false
  
  @IBAction func touchDigit(_ sender: UIButton) {
    let digit = sender.currentTitle!
    
    if userIsInTheMiddleOfTyping{
      let textCurrentlyInDisplay = display.text!
      display.text = textCurrentlyInDisplay + digit
    }else{
      display.text = digit
      userIsInTheMiddleOfTyping = true
    }
    
  }
  
  var displayValue: Double{
    get{
      return Double(display.text!)!
    }
    set{
      display.text = String(newValue)
    }
  }
  
  private var brain = CalculatorBrain()

  @IBAction func performOperation(_ sender: UIButton) {
    if userIsInTheMiddleOfTyping{
      brain.setOperand(displayValue)
    }
    if let mathematicalSymbol = sender.currentTitle{
      brain.performOperation(mathematicalSymbol)
    }
    if let result = brain.result{
      displayValue = result
    }
  }
}



