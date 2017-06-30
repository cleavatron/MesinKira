//
//  CalculatorBrain.swift
//  MesinKira
//
//  Created by Ahmad Fairiz on 01/07/2017.
//  Copyright © 2017 Recite Lab. All rights reserved.
//

import Foundation

struct CalculatorBrain{
  
  private var accumulator: Double?
  
  mutating func performOperation(_ symbol: String){
    
    switch symbol {
    case "π":
      accumulator = Double.pi
    case "√":
      if let operand = accumulator{
        accumulator = sqrt(operand)
      }
    default:
      break
    }
    
  }
  
  mutating func setOperand(_ operand: Double){
    accumulator = operand
  }
  
  var result: Double? {
    get{
      return accumulator
    }
  }
  
}
