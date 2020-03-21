//
//  SettingsView.swift
//  SecureVid
//
//  Created by Sachin Khanal on 3/13/20.
//  Copyright © 2020 Sachin Khanal. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    var userProfile: UserProfile
    @EnvironmentObject var session: SessionStore
    //func alert(){
//        let alert = UIAlertController(title: "Did you bring your towel?", message: "It's recommended you bring your towel before continuing.", preferredStyle: .alert)
    // }
       func getUser(){
          session.listen()
       }
    var body: some View {
        
        NavigationView{
            VStack{
                Form{
                    //Text("Welcome back \(session.session!.email ?? "user")")
                    //Text(userProfile.uid)
                    Text(userProfile.firstName)
                    Text(userProfile.lastName)
                    Text(userProfile.city)
                    
                    //                       Button(action: session.signOut){
                    //                       Text("Sign Out")
                    //               }
                }
                //Text("This is an Account Page")
            }.navigationBarTitle("Account")
                .navigationBarItems(trailing: Button(action: {
                    self.session.signOut()
                }, label: {
                    Text("Sign Out")
                }))

        }
                  
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
       let userProfile = UserProfile(uid: "", firstName: "Sachin", lastName: "Friese", city: "Kathmandu")
        return SignedIn_View(userProfile: userProfile)
    }
}
