//
//  ButtonSetView.swift
//  Calculator
//
//  Created by mount_potato on 2021/9/20.
//


import SwiftUI

struct ButtonSetView: View{
    
    @ObservedObject var viewModel: CalculatorViewModel
    
    let geometry: GeometryProxy
    
    struct BaseButtonView: View {
        
        let text: String
        let buttonColor: Color
        let fontColor: Color
        let borderColor: Color
        let width: CGFloat
        let height: CGFloat
        
        var body: some View {

            ZStack{
                Text(text)
                    .fontWeight(.heavy)
                    .font(.title)
                    .frame(width: width, height: height, alignment:.center)
                    .padding() //以background修饰器建立背景搭配间距的按钮
                    .background(buttonColor) //背景颜色为按钮主色调
                    .cornerRadius(40)
                    .foregroundColor(fontColor) //字体颜色前景色调
                    //.font(.system(size: size/3))
                    .padding(10)    //结合border在按钮周围加上间距
                    .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(borderColor, lineWidth: 5)
                        )
                    .scaledToFit()
                    .minimumScaleFactor(0.05)
                    
                    
            }
            .alignmentGuide(VerticalAlignment.center, computeValue: { $0[.bottom]
            })
        }
    }

    struct NumberButton: View{
        
        let number: Double
        let width: CGFloat
        let height: CGFloat
        let viewModel: CalculatorViewModel
        
        var body: some View{
            Button(action: {
                viewModel.calculateClicked(on: String(Int(number)))
    
            }, label: {
                BaseButtonView(text: String(Int(number)),
                               buttonColor: Color.red,
                               fontColor: Color.white,
                               borderColor: Color.red,
                               width: width,
                               height: height)
                
            })
        }
    }


    struct OperatorButton: View{
        
        let operatorMark: String
        let width: CGFloat
        let height: CGFloat
        let viewModel: CalculatorViewModel
        
        var body: some View{
            Button(action: {
                if operatorMark == "=" {
                    viewModel.equalClicked()
                }
                else if operatorMark == "C"{
                    viewModel.clearClicked()
                }
                else{
                    viewModel.calculateClicked(on: operatorMark)
                }
            }, label: {
                BaseButtonView(text: operatorMark,
                               buttonColor: Color.gray,
                               fontColor: Color.white,
                               borderColor: Color.gray,
                               width: width,
                               height: height)
            })
           
        }
    }


    struct SquareNumberButton: View{
        let number: Double
        let size: CGFloat
        let viewModel: CalculatorViewModel
        var body: some View{
            NumberButton(number: number, width: size, height: size,viewModel: viewModel)
        }
    }


    struct SquareOperatorButton: View{
        let operatorMark: String
        let size: CGFloat
        let viewModel: CalculatorViewModel
        
        var body: some View{
            OperatorButton(operatorMark: operatorMark,
                           width: size,
                           height: size,
                           viewModel: viewModel)
        }
    }


    
    var body: some View{
        

        
        let size:CGFloat = geometry.size.width/14
        

        ZStack{
            
            VStack{
                HStack{
                    SquareOperatorButton(operatorMark: "sin", size: size, viewModel: viewModel)
                    SquareOperatorButton(operatorMark: "cos", size: size, viewModel: viewModel)
                    SquareOperatorButton(operatorMark: "tan", size: size, viewModel: viewModel)
                    SquareOperatorButton(operatorMark: "e", size: size, viewModel: viewModel)
                    
                }
                HStack{
                    SquareOperatorButton(operatorMark: "C", size: size, viewModel: viewModel)
                    SquareOperatorButton(operatorMark: "(", size: size, viewModel: viewModel)
                    SquareOperatorButton(operatorMark: ")", size: size, viewModel: viewModel)
                    SquareOperatorButton(operatorMark: "+", size: size, viewModel: viewModel)
                    
                }
                HStack{
                    SquareNumberButton(number: 7, size: size, viewModel: viewModel)
                    SquareNumberButton(number: 8, size: size, viewModel: viewModel)
                    SquareNumberButton(number: 9, size: size, viewModel: viewModel)
                    SquareOperatorButton(operatorMark: "-", size: size, viewModel: viewModel)
                }
                HStack{
                    SquareNumberButton(number: 4, size: size, viewModel: viewModel)
                    SquareNumberButton(number: 5, size: size, viewModel: viewModel)
                    SquareNumberButton(number: 6, size: size, viewModel: viewModel)
                    SquareOperatorButton(operatorMark: "×", size: size, viewModel: viewModel)
                }
                HStack{
                    SquareNumberButton(number: 1, size: size, viewModel: viewModel)
                    SquareNumberButton(number: 2, size: size, viewModel: viewModel)
                    SquareNumberButton(number: 3, size: size, viewModel: viewModel)
                    SquareOperatorButton(operatorMark: "÷", size: size, viewModel: viewModel)
                }
                HStack{
                    NumberButton(number: 0, width: size*4.3, height: size, viewModel: viewModel)
                    SquareOperatorButton(operatorMark: ".", size: size, viewModel: viewModel)
                    SquareOperatorButton(operatorMark: "=", size: size, viewModel: viewModel)
                }
            }
        }
        .padding(.horizontal)
        .frame(alignment:.center)

        
    }
}

