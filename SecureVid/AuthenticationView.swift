//
//  AuthenticationView.swift
//  SecureVid
//
//  Created by Sachin Khanal on 3/17/20.
//  Copyright © 2020 Sachin Khanal. All rights reserved.
//

import SwiftUI

struct AuthenticationView: View {
    @EnvironmentObject var session: SessionStore
    @State var profile: UserProfile?
    @State var error: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var city: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    @State var showSignUpForm = false
    @State var showDetails = false
    
    @ObservedObject var sessionStore = SessionStore()
    //  @State var profile: UserProfile?
    func getUser(){
        session.listen()
    }
    var body: some View {
        Group{
            // {
            //}
            if (session.session != nil){
                
                TabView {
                    // 2
                    SignedIn_View(userProfile: self.profile ??  UserProfile(uid: "", firstName: "", lastName: "", city: ""))
                        .tabItem {
                            VStack {
                                Image(systemName: "person.circle")
                                Text("Home")
                            }
                    }.tag(1)
                    
                    SettingsView()
                        .tabItem {
                            VStack {
                                Image(systemName: "gear")
                                Text("Settings")
                            }
                    }.tag(2)
                }
                
            }
                
            else{
                // Login Page
                if(showSignUpForm == false){
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
                            //.background(Color())
                            .cornerRadius(4.0)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                        
                        //.overlay(Rectangle().stroke(Color.blue, lineWidth: 1))
                        
                        SecureField("Password", text: $password)
                            .padding()
                            //.background(Color("green"))
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
                            Text("New to SecureVid?")
                                .foregroundColor(.purple)
                            Button(action: {
                                self.showSignUpForm = true
                            }){
                                Text("SignUp")
                                    .fontWeight(.semibold)
                                    // .font(.title)
                                    .padding()
                                    .foregroundColor(.purple)
                            }
                            
                        }
                        
                    }
                }
                else{
                    //Signup Page
                    NavigationView{
                        VStack(){
                            Form {
                                Section(header: Text("")){
                                    TextField("First Name", text: $firstName)
                                        .textContentType(.givenName)
                                    //.textFieldStyle(RoundedBorderTextFieldStyle())
                                    // .frame(width: 350, height: 30)
                                    TextField("Last Name", text: $lastName)
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
                         //   if (password != "" && password == confirmPassword){
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
                           // }
                            if (error != ""){
                                Text(error)
                                    .fontWeight(.semibold)
                                    .font(.title)
                                    .foregroundColor(.red)
                                    .padding()
                                
                            }
                            HStack(){
                                Text("Already have an account?")
                                    .foregroundColor(.purple)
                                Button(action: {
                                    self.showSignUpForm = false
                                }){
                                    Text("SignIn")
                                        .fontWeight(.semibold)
                                        //.font(.title)
                                        .padding()
                                        .foregroundColor(.purple)
                                }
                                
                            }
                            
                        }.navigationBarTitle("SignUP")
                    }
                    
                    
                }
                
                
                
            }
        }.onAppear(perform: getUser)
        
        
    }
    
    func signUp() {
        sessionStore.signUp(email: self.email, password: self.password, firstName: self.firstName, lastName: self.lastName, city: self.city) { (profile, error) in
            if let error = error {
                print("Error when signing up: \(error)")
                return
            }
            else{
                self.email = ""
                self.password = ""
                self.confirmPassword = ""
                self.firstName = ""
                self.lastName = ""
                self.city = ""
            }
            self.profile = profile
            // self.showDetails.toggle()
        }
    }
    
    func signIn() {
        sessionStore.signIn(email: self.email, password: self.password) { (profile, error) in
            if let error = error {
                print("Error when signing up: \(error)")
                return
            }
            else{
                self.email = ""
                self.password = ""
            }
            self.profile = profile
            //self.showDetails.toggle()
        }
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView().environmentObject(SessionStore())
    }
}
