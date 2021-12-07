//
//  LoginView.swift
//  MyRecipes
//
//  Created by haju Kim on 2021/12/07.
//

import SwiftUI

struct SignView: View {
    
    // MARK: - 필드값
   
    @State var maxCircleHeight: CGFloat = 0
    @State var showSignUp = false
    
    // MARK: - helper
    
    var body: some View {
        VStack{
            
            GeometryReader { proxy -> AnyView in
                let height = proxy.frame(in: .global).height
                
                DispatchQueue.main.async {
                    if maxCircleHeight == 0{
                        maxCircleHeight = height
                    }
                }
                
                return AnyView(
                    ZStack{
                        
                        Circle()
                            .fill(Color("choco"))
                            .offset(x: getRect().width / 2, y: -height / 1.3)
                            .offset(x: -30, y: getRect().height < 750 ? 10 :  0)
                        
                        Circle()
                            .fill(Color("choco"))
                            .offset(x: -getRect().width / 2, y: -height / 1.5)
                        
                        Circle()
                            .fill(Color("mint"))
                            .offset(y: -height / 1.3)
                            .rotationEffect(.init(degrees: -5))
                    }
                )
            }
            .frame(maxHeight: getRect().width)
           
            ZStack{
                
                if showSignUp{
                    SignUpView()
                        .transition(.move(edge: .trailing))
                }
                else {
                    LoginView()
                        .transition(.move(edge: .trailing))
                }
            }
            .padding()
            .padding(.top,-maxCircleHeight / (getRect().height < 750 ? 1.5 : 1.6))
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .overlay(
            
            HStack {
                
                Text(showSignUp ? "회원 가입" : "이미 아이디가 있습니다.")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                Button(action: {
                    withAnimation {
                        showSignUp.toggle()
                    }
                }, label: {
                    Text(showSignUp ? "sign in" : "sign up")
                        .fontWeight(.bold)
                        .foregroundColor(Color("mint"))
                })
                
            }
                .padding(.bottom,getSafeArea().bottom == 0 ? 15 : 0)
            ,alignment: .bottom

        )
        .background(
            
            HStack{
                
                Circle().fill(Color("mint"))
                    .frame(width: 70, height: 70)
                    .offset(x: -30, y: 0)
                
                Spacer(minLength: 0)
                
                Circle()
                    .fill(Color("choco"))
                    .frame(width: 110, height: 110)
                    .offset(x: 40, y: 20)
                
            }
                .offset(y: getSafeArea().bottom + 30)
            ,alignment: .bottom
        )
    }
}

struct SignView_Previews: PreviewProvider {
    static var previews: some View {
        SignView()
    }
}

extension View{
    
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
    
    func getSafeArea()->UIEdgeInsets{
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
