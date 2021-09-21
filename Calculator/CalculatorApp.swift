//
//  CalculatorApp.swift
//  Calculator
//
//  Created by mount_potato on 2021/9/16.
//

import SwiftUI

@main
struct CalculatorApp: App {
    
    
    var body: some Scene {
        
        let game = CalculatorViewModel()
        
        WindowGroup {
            ContentView(gameViewModel: game)
        }
    }
}
