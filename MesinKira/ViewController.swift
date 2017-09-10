//
//  ViewController.swift
//  MesinKira
//
//  Created by Ahmad Fairiz on 29/06/2017.
//  Copyright © 2017 Recite Lab. All rights reserved.
//

import UIKit

extension UIUserInterfaceSizeClass: CustomStringConvertible {
  public var description: String {
    switch self {
    case .compact: return "compact"
    case .regular: return "regular"
    default: return "unspecified"
    }
  }
}

class ViewController: UIViewController {

  @IBOutlet weak var display: UILabel!
  
  var userIsInTheMiddleOfTyping = false
  
  // Auto-layout stuff
  private func showSizeClasses(){
    if !userIsInTheMiddleOfTyping{
      display.textAlignment = .center
      display.text = "width " + traitCollection.horizontalSizeClass.description + " height " + traitCollection.verticalSizeClass.description
      
    }
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    showSizeClasses()
  }
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    coordinator.animate(alongsideTransition: { (coordinator) in
      self.showSizeClasses()
    }, completion: nil)
  }
  
  
  
  
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
      userIsInTheMiddleOfTyping = false
    }
    
    if let mathematicalSymbol = sender.currentTitle{
      brain.performOperation(mathematicalSymbol)
    }
    if let result = brain.result{
      displayValue = result
    }
  }
}



