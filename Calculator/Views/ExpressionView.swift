//
//  ExpressionView.swift
//  Calculator
//
//  Created by mount_potato on 2021/9/16.
//

import Foundation
import SwiftUI



struct ScreenView: View{

    @ObservedObject var viewModel: CalculatorViewModel
    
    let geometry: GeometryProxy
    
    //TODO:添加动画

    var body: some View {
        
            
        let height = geometry.size.height
        let width = geometry.size.width
        
        ScrollView(.horizontal){
            
            HStack{
        
                if viewModel.expression == ""{
                    Text("input here...")
                        .font(.system(size:50))
                        .foregroundColor(.gray)
                        .opacity(0.7)
                        .padding(.bottom, height/6)
                        .frame(width: width)
                }
                
                else{

                    Text(self.viewModel.expression)
                        .font(.system(size:50))
                        .padding(.bottom, height/6)
                        .frame(width: geometry.size.width)
                    
                }
            }

        }
            
    }
}

