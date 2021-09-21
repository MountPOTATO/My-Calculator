//
//  CalculatorModel.swift
//  Calculator
//
//  Created by mount_potato on 2021/9/16.
//

import Foundation

extension Double{
    
    var cleanZero: String{
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
    
    func roundTo(places:Int) -> Double {

           let divisor = pow(10.0, Double(places))

           return (self * divisor).rounded() / divisor

    }
}

struct CalculatorModel{
    
    private(set) var expression: String
    private(set) var result: Double
    
    init() {
        expression = ""
        result = 0
    }
    
    
    mutating func updateExpression(with exp:String){
        
        if exp=="e"{
            self.expression += "exp("
        }
        else{
            self.expression += exp
            if exp=="sin" || exp=="cos" || exp=="tan"{
                self.expression += "("
            }
        }
        
    }
    
    mutating func runCalculation()->Bool{
        do{
            result = try expression.evaluate()
            expression = result.roundTo(places: 6).cleanZero
        }
        catch{
            
            return false
        }
        
        return true
    }
    
    mutating func clearExpression(){
        expression = ""
        result = 0
    }
    
}
