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
    //  @EnvironmentObject var session: SessionStore
    //    func getUser(){
    //        session.listen()
    //    }
    var body: some View {
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
        }
        // Text("Welcome \( getuid())")
    }
}

struct SignedIn_View_Previews: PreviewProvider {
    static var previews: some View {
        let userProfile = UserProfile(uid: "", firstName: "Sachin", lastName: "Friese", city: "Kathmandu")
        return SignedIn_View(userProfile: userProfile)
    }
}
