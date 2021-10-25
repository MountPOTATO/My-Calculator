//
//  ContentView.swift
//  Calculator
//
//  Created by mount_potato on 2021/9/16.
//


import SwiftUI


struct ContentView: View {
    
    @ObservedObject var gameViewModel : CalculatorViewModel
    
    // 横竖屏判断
    @State private var isLandscape = false
    
    // 横竖屏判断的publisher
    let orientationPublisher = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
    
    var body: some View {
        
        // GeometryReader代理，用于设置表达式视图
        
        GeometryReader{ geometry in
            
            ContentViewVHStack(isLandscape: isLandscape){
            
                
                if isLandscape{
                    // 竖屏（处理不了180°翻转）
                    ExpressionView(viewModel: gameViewModel).frame(width: geometry.size.width/2,
                                                                                  height:geometry.size.height)
       

                    ButtonSetView(viewModel: gameViewModel)
                }else{
                    //横屏
                    ExpressionView(viewModel: gameViewModel).frame(width: geometry.size.width, height: geometry.size.height/4)
       

                    ButtonSetView(viewModel: gameViewModel)
                }
                


                        
            }.onReceive(orientationPublisher){ _ in
                let windowScene = UIApplication.shared.windows.first?.windowScene
                self.isLandscape = windowScene?.interfaceOrientation.isLandscape ?? false
            }
        }
        
    }
}


//Preview in XCode 13
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


//横竖屏划分栈
struct ContentViewVHStack<Content: View>: View{

    let isLandscape : Bool
    let content: ()->Content
    
    init(isLandscape: Bool, @ViewBuilder content: @escaping ()->Content){
        self.isLandscape = isLandscape
        self.content = content
    }
    
    var body: some View{
        Group{
            if isLandscape {
                //横屏时用HStack
                HStack(spacing: 0){
                    content()
                }
            }else{
                //竖屏时用VStack
                VStack(spacing: 0){
                    content()
                }
            }
        }
    }
}
