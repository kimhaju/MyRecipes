//
//  SignUpView.swift
//  MyRecipes
//
//  Created by haju Kim on 2021/12/07.
//

import SwiftUI

struct SignUpView: View {
    
    // MARK: - 필드값
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var username: String = ""
    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @State private var profileImage: Image?
    @State private var pickedImage: Image?
    @State private var imageData: Data = Data()
    @State private var error : String = ""
    @State private var showingAlert = false
    @State private var alertTitle: String = "회원가입에 문제가 생겼습니다...😔"
    
    // MARK: - 뷰 본체 시작
    
    var body: some View {
        VStack{
            Text("Sign Up")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("choco"))
                .kerning(1.9)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 8, content:{
                
                Text("이메일")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                TextField("이메일을 입력하세요.", text: $email)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("choco"))
                    .padding(.top,5)
                
                Divider()
            })
                .padding(.top,25)
            
            VStack(alignment: .leading, spacing: 8, content:{
                
                Text("이름")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                TextField("이름을 입력하세요.", text: $username)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("choco"))
                    .padding(.top,5)
                
                Divider()
            })
                .padding(.top,20)
            
            VStack(alignment: .leading, spacing: 8, content:{
                
                Text("비밀번호")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                SecureField("비번을 입력하세요. ", text: $password)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color("choco"))
                    .padding(.top,5)
                
                Divider()
            })
                .padding(.top,20)
            

            Button(action: {
                //-> 여기에 파이어 베이스 명령어 
            }, label: {
                Image(systemName: "arrow.right")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("choco"))
                    .clipShape(Circle())
                    .shadow(color: Color("mint").opacity(0.6), radius: 5, x: 0, y: 0)
            })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top,10)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
