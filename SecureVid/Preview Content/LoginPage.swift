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
                self.email = "sfg"
                self.password = "sdfg"
                
            }
           // ContentView()
            
        }
    }
    var body: some View {
   
        NavigationView{
            VStack() {
                TextField("Email Address", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350, height: 30)
              
                    //.overlay(Rectangle().stroke(Color.blue, lineWidth: 1))
            
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350, height: 30)
                //.overlay(Rectangle().stroke(Color.blue, lineWidth: 1))
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
            
            }
                
            }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
