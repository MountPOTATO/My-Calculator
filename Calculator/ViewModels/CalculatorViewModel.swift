//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by mount_potato on 2021/9/16.
//

import SwiftUI
import Foundation


class CalculatorViewModel: ObservableObject{
    @Published var model = CalculatorModel()
    

        
    var expression: String{
        
        return model.expression
    }

    var result: Double{
        
        return model.result
        
    }
    


    func calculateClicked(on buttonContent: String){
        model.updateExpression(with: buttonContent)
    }
    
    func equalClicked()->Bool{
        if model.runCalculation()==false{
            //TODO:错误处理
            return false
            
        }else{
            return true
        }
    }
    
    func clearClicked(){
        model.clearExpression()
    }
   
}
