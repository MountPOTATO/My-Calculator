//
//  ButtonSetView.swift
//  Calculator
//
//  Created by mount_potato on 2021/9/20.
//


import SwiftUI

struct ButtonSetView: View{
    
    @ObservedObject var viewModel: CalculatorViewModel
    
    
    struct BaseButtonView: View {
        
        let text: String
        let buttonColor: Color
        let fontColor: Color
        let borderColor: Color

        
        let radius: CGFloat = 20
        
        var body: some View {
            
            
            GeometryReader{ geo in
            

                Text(text)
                    .fontWeight(.bold)
                    .font(.system(.largeTitle, design: .rounded))
                    .padding()
                    .frame(width:geo.size.width,
                           height:geo.size.height,
                           alignment:.center)
                    //以background修饰器建立背景搭配间距的按钮
                    .background(buttonColor) //背景颜色为按钮主色调
                    .cornerRadius(radius)
                    .foregroundColor(fontColor) //字体颜色前景色调

                    .overlay(
                        RoundedRectangle(cornerRadius: radius)
                            .stroke(fontColor, lineWidth: 5)
                        )
                    .scaledToFit()
                    .minimumScaleFactor(0.5)
                

            }
            .background(buttonColor) //背景颜色为按钮主色调
            .cornerRadius(radius)

            

            
        }
        
    }

    struct NumberButton: View{
        
        let number: Double

        let viewModel: CalculatorViewModel
        
        @Environment(\.colorScheme) var colorScheme
        
        var body: some View{
            Button(action: {
                viewModel.calculateClicked(on: String(Int(number)))
    
            }, label: {
                
                if colorScheme == .light {
                    BaseButtonView(text: String(Int(number)),
                                   buttonColor: Color.gray,
                                   fontColor: Color.black,
                                   borderColor: Color.gray)
                }else{
                    BaseButtonView(text: String(Int(number)),
                                   buttonColor: Color.red,
                                   fontColor: Color.white,
                                   borderColor: Color.red)
                }
                

                
            })
        }
    }


    struct OperatorButton: View{
        
        // 按下等于号时如果计算错误时的报警，弹出警告窗格
        @State private var showingAlert = false
        
        let operatorMark: String
        
        let viewModel: CalculatorViewModel
        
        @Environment(\.colorScheme) var colorScheme
        
        var body: some View{
            Button(action: {
                if operatorMark == "=" {
                    if(viewModel.equalClicked()==false){
                        
                        self.showingAlert = true
                        
                    }
                }
                else if operatorMark == "C"{
                    viewModel.clearClicked()
                }
                else{
                    viewModel.calculateClicked(on: operatorMark)
                }
            }, label: {
                
                if colorScheme == .light{
                    BaseButtonView(text: operatorMark,
                                   buttonColor: Color.blue,
                                   fontColor: Color.black,
                                   borderColor: Color.blue)
                }else{
                    BaseButtonView(text: operatorMark,
                                   buttonColor: Color.gray,
                                   fontColor: Color.white,
                                   borderColor: Color.gray)
                }
            })
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Calculation Error"),
                      message: Text("Present expression is illegal, please examine your input."),
                      dismissButton: .default(Text("OK")))
            }
           
        }
    }


    

    
    var body: some View{
        
    
        ZStack(alignment: .leading){
            
            VStack(alignment: .leading){
                HStack(){
                    OperatorButton(operatorMark: "sin", viewModel: viewModel)
                    OperatorButton(operatorMark: "cos", viewModel: viewModel)
                    OperatorButton(operatorMark: "tan", viewModel: viewModel)
                    OperatorButton(operatorMark: "e", viewModel: viewModel)
                    
                }
                HStack{
                    OperatorButton(operatorMark: "C", viewModel: viewModel)
                    OperatorButton(operatorMark: "(", viewModel: viewModel)
                    OperatorButton(operatorMark: ")", viewModel: viewModel)
                    OperatorButton(operatorMark: "+", viewModel: viewModel)
                    
                }
                HStack{
                    NumberButton(number: 7, viewModel: viewModel)
                    NumberButton(number: 8, viewModel: viewModel)
                    NumberButton(number: 9, viewModel: viewModel)
                    OperatorButton(operatorMark: "-", viewModel: viewModel)
                }
                HStack{
                    NumberButton(number: 4, viewModel: viewModel)
                    NumberButton(number: 5, viewModel: viewModel)
                    NumberButton(number: 6, viewModel: viewModel)
                    OperatorButton(operatorMark: "×", viewModel: viewModel)
                }
                HStack{
                    NumberButton(number: 1, viewModel: viewModel)
                    NumberButton(number: 2, viewModel: viewModel)
                    NumberButton(number: 3, viewModel: viewModel)
                    OperatorButton(operatorMark: "÷", viewModel: viewModel)
                }
                HStack{
                    VStack{
                        NumberButton(number: 0, viewModel: viewModel)
                    }
                    HStack{
                        OperatorButton(operatorMark: ".", viewModel: viewModel)
                        OperatorButton(operatorMark: "=", viewModel: viewModel)
                    }
                   
                }
            }
        }
        .frame(alignment:.center)
        .padding()

        
    }
}

struct ButtonSetView_Previews: PreviewProvider {
    static var previews: some View {
        let game = CalculatorViewModel()
        Group {
            ContentView(gameViewModel: game)

            ContentView(gameViewModel: game)
                .preferredColorScheme(.dark)
        }
    }
}
