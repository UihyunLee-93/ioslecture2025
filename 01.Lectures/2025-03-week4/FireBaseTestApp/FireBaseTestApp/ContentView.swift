//
//  ContentView.swift
//  FireBaseTestApp
//
//  Created by Uihyun.Lee on 4/7/25.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn{
            ListView()
        } else {
            content
        }
    }
    var content: some View {
        ZStack {
            Color.cyan
            ZStack {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.blue, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 1000, height: 1000)
                    .rotationEffect(.degrees(-150))
                    .offset(y: 350)
                ZStack{
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .foregroundStyle(.linearGradient(colors: [.blue, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 1000, height: 500)
                        .rotationEffect(.degrees(150))
                        .offset(y: 350)
                }
            }
            VStack(spacing: 20) {
                Text("Hello")
                    .foregroundColor(.white)
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .offset(x: -100, y: -100)
                
                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: email.isEmpty) {
                        Text("Email").foregroundColor(.white)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                SecureField("비밀번호", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("비밀번호").foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                Button {
                    signUp()
                } label: {
                    Text("Sign up")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .fill(.linearGradient(colors: [.orange, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing))
                        )
                        
                    
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                }.padding(.top)
                    .offset(y: 100)
                Button {
                    login()
                } label: {
                    Text("계정이 있으시면 여기를 눌러주세요!")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .bold, design: .rounded))
                }.padding(.top)
                    .offset(y: 100)
                
            }
            
            .frame(width: 350)
            .onAppear {
                try? Auth.auth().signOut() 
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil {
                        isLoggedIn.toggle()
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!)
            }
        }
    }
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error creating user: \(error)")
            }
        }
    }
    
}

#Preview {
    ContentView()
}
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
