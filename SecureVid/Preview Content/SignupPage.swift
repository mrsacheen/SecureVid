//
//  SignupPage.swift
//  SecureVid
//
//  Created by Sachin Khanal on 3/11/20.
//  Copyright © 2020 Sachin Khanal. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct SignupPage: View {
    @EnvironmentObject var session: SessionStore
    
   @State private var userFirstName: String = ""
    @State private var userLastName: String = ""
     @State private var email: String = ""
       @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State var error:String = ""
    
    func signUp() {
        session.signUp(email: email, password: password) {(result, error) in
            if let error = error {
                self.error = error.localizedDescription
            }else{
                self.email = ""
                self.password = ""
               // HomeView()
                
            }
        }
    }
       var body: some View {
      
           NavigationView{
               VStack() {
                TextField("First Name", text: $userFirstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 350, height: 30)
                TextField("Last Name", text: $userLastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 350, height: 30)
                   TextField("Email Address", text: $email)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .frame(width: 350, height: 30)
                       //.overlay(Rectangle().stroke(Color.blue, lineWidth: 1))
               
                   SecureField("Password", text: $password)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .frame(width: 350, height: 30)
                SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 350, height: 30)
                   //.overlay(Rectangle().stroke(Color.blue, lineWidth: 1))
                if (password != "" && password == confirmPassword){
                    Button(action: signUp) {
                            Text("SignUp")
                                .fontWeight(.bold)
                                
                                .font(.title)
                               
                   }
                }
//                if (error == ""){
//                    db.collection("")
//                }
                if (error != ""){
                    Text(error)
                    .fontWeight(.semibold)
                    .font(.title)
                        .foregroundColor(.red)
                    .padding()
                }
                
               
               }
                   
               //.padding()
               .navigationBarTitle(Text("SignUp"))
               }
       }
}
struct Auth_View: View {
    var body: some View{
        NavigationView{
            SignupPage()
        }
    }
}
struct SignupPage_Previews: PreviewProvider {
    static var previews: some View {
        Auth_View().environmentObject(SessionStore())
    }
}
