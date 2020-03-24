//
//  SignedIn_View.swift
//  SecureVid
//
//  Created by Sachin Khanal on 3/11/20.
//  Copyright © 2020 Sachin Khanal. All rights reserved.
//

import SwiftUI

struct SignedIn_View: View {
    var userProfile: UserProfile
    @EnvironmentObject var session: SessionStore
    func getUser(){
        session.listen()
    }
    var body: some View {
        //NavigationView{
            ZStack{
                CameraView()
                    .colorScheme(.dark)
                    .blur(radius: 20)
                    .edgesIgnoringSafeArea(.top)
                NavigationView{
                    Form{
                        //Text("Welcome back \(session.session!.email ?? "user")")
                        //Text(userProfile.uid)
                        Text(userProfile.firstName)
                        Text(userProfile.lastName)
                        Text(userProfile.city)
                        
                        //                       Button(action: session.signOut){
                        //                       Text("Sign Out")
                        //               }
                    }.navigationBarTitle("\(userProfile.firstName)")
                    
                }.colorScheme(.dark)
                .opacity(0.8)
                
                
            }
        
        }
    
        // Text("Welcome \( getuid())")
   // }
}

struct SignedIn_View_Previews: PreviewProvider {
    static var previews: some View {
        let userProfile = UserProfile(uid: "", firstName: "Sachin", lastName: "Friese", city: "Kathmandu")
        return SignedIn_View(userProfile: userProfile)
    }
}
