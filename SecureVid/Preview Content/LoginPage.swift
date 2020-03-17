//
//  LoginPage.swift
//  SecureVid
//
//  Created by Sachin Khanal on 3/10/20.
//  Copyright © 2020 Sachin Khanal. All rights reserved.
//

import SwiftUI

struct LoginPage: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State var error: String = ""
    
    @EnvironmentObject var session: SessionStore
    
    func signIn(){
        session.signIn(email: email, password: password){(result, error) in
            if let error = error {
                self.error = error.localizedDescription
            }else{
                self.email = ""
                self.password = ""
                
            }
            
        }
    }
    var body: some View {
   
        NavigationView{
            VStack() {
                Image("Camera")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fit)
                .frame(width: 74.0, height: 74.0)
                .padding(Edge.Set.bottom, 20)
                
                Text("Login").bold().font(.title)
                
                Text("A video calling app")
                .font(.subheadline)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 70, trailing: 0))
                TextField("Email Address", text: $email)
                    .textContentType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color("flash-white"))
                    .cornerRadius(4.0)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
              
                    //.overlay(Rectangle().stroke(Color.blue, lineWidth: 1))
            
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color("flash-white"))
                    .cornerRadius(4.0)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                Button(action: signIn) {
                        Text("Login")
                            .fontWeight(.semibold)
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .frame(width: 130.0, height: 39.0)
                            .background(LinearGradient(gradient: Gradient(colors: [Color(.purple),Color(.blue)]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(40)
                   // ContentView()
                    
                }
                if (error != ""){
                    Text(error)
                    .fontWeight(.semibold)
                    .font(.title)
                        .foregroundColor(.red)
                    .padding()
                }
                Spacer()
                HStack(){
                        Text("Already have an account?")
                            .foregroundColor(.purple)
                    NavigationLink(destination: SignupPage()) {
                        Text("SignUp")
                            .fontWeight(.semibold)
                            .font(.title)
                            .padding()
                            .foregroundColor(.purple)
                            //.frame(width: 130.0)
                            //.background(LinearGradient(gradient: Gradient(colors: [Color(.purple),Color(.blue)]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(40)
                    }
                   // Spacer(minLength: 30)
                }
            
            }
                
            }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
