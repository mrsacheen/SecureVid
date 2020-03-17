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
    @State private var city: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State var error:String = ""
    
    @State var profile: UserProfile?
    func signUp() {
        session.signUp(email: email, password: password, firstName: userFirstName, lastName: userLastName, city: city) {(result, error) in
            if let error = error {
                self.error = error.localizedDescription
            }else{
                self.userFirstName = ""
                self.userLastName = ""
                self.email = ""
                self.password = ""
                self.confirmPassword = ""
            }
        }
    }
    var body: some View {
        
        NavigationView{
            VStack{
                Form {
                    Section(header: Text("")){
                        TextField("First Name", text: $userFirstName)
                            .textContentType(.givenName)
                        //.textFieldStyle(RoundedBorderTextFieldStyle())
                        // .frame(width: 350, height: 30)
                        TextField("Last Name", text: $userLastName)
                            .textContentType(.familyName)
                        //.textFieldStyle(RoundedBorderTextFieldStyle())
                        // .frame(width: 350, height: 30)
                        TextField("Email Address", text: $email)
                            .textContentType(.emailAddress)
                            .autocapitalization(.none)
                        // .textFieldStyle(RoundedBorderTextFieldStyle())
                        //  .frame(width: 350, height: 30)
                        TextField("City", text: $city)
                    }
                    // .overlay(Rectangle().stroke(Color.blue, lineWidth: 1))
                    
                    SecureField("Password", text: $password)
                    // .textFieldStyle(RoundedBorderTextFieldStyle())
                    //.frame(width: 350, height: 30)
                    SecureField("Confirm Password", text: $confirmPassword)
                    //.textFieldStyle(RoundedBorderTextFieldStyle())
                    //.frame(width: 350, height: 30)
                    ////.overlay(Rectangle().stroke(Color.blue, lineWidth: 1))
                }
                if (password != "" && password == confirmPassword){
                    Button(action: {
                        self.signUp()
                    }){
                        Text("SignUp")
                            .fontWeight(.semibold)
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .frame(width: 130.0, height: 39.0)
                            .background(LinearGradient(gradient: Gradient(colors: [Color(.purple),Color(.blue)]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(40)
                    }
                    Spacer()
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
            //.padding()
            .navigationBarTitle(Text("SignUp"))
    }
}
struct Auth_View: View {
    var body: some View{
        SignupPage()
    }
}
struct SignupPage_Previews: PreviewProvider {
    static var previews: some View {
        Auth_View().environmentObject(SessionStore())
    }
}
