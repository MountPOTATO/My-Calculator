//
//  ContentView.swift
//  Calculator
//
//  Created by mount_potato on 2021/9/16.
//


import SwiftUI


struct ContentView: View {
    
    @ObservedObject var gameViewModel : CalculatorViewModel
    
    var body: some View {
        
        
        GeometryReader{ geometry in
            VStack{
                Divider()
                ScreenView(viewModel: gameViewModel,geometry: geometry)
                Divider()
                ButtonSetView(viewModel: gameViewModel,geometry: geometry)
                    
                    
            }
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = CalculatorViewModel()
        Group {
            ContentView(gameViewModel: game)
            ContentView(gameViewModel: game)
                .preferredColorScheme(.dark)
        }
    }
}
