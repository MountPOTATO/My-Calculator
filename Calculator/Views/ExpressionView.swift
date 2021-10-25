//
//  ExpressionView.swift
//  Calculator
//
//  Created by mount_potato on 2021/9/16.
//

import Foundation
import SwiftUI



struct ExpressionView: View{

    @ObservedObject var viewModel: CalculatorViewModel
    

    // 获取当前设备的主题色，以配置亮色和暗色主题下不同的计算器外观
    @Environment(\.colorScheme) var colorScheme
    

    var body: some View {
        
        
        if colorScheme == .light{
            VStack{
        
                if viewModel.expression == ""{
                    Text("input here...")
                        .font(.system(.largeTitle, design: .rounded))
                        .foregroundColor(Color(hue: 1.0, saturation: 0.22, brightness: 0.343))
                        .opacity(0.7)

                }
                
                else{

                    Text(self.viewModel.expression)
                        .font(.system(.largeTitle, design: .rounded))
                    
                    }
            }
        }else{
            VStack{
            
                if viewModel.expression == ""{
                    Text("input here...")
                        .font(.system(.largeTitle, design: .rounded))
                        .foregroundColor(Color(hue: 1.0, saturation: 0.051, brightness: 0.929))
                        .opacity(0.7)

                }
                
                else{

                    Text(self.viewModel.expression)
                        .font(.system(.largeTitle, design: .rounded))
                    
                }
            }
        }
            
    }
}


struct ExpressionView_Previews: PreviewProvider {
    static var previews: some View {
        let game = CalculatorViewModel()
        Group {
            ContentView(gameViewModel: game)
            ContentView(gameViewModel: game)
                .preferredColorScheme(.dark)
        }
    }
}


