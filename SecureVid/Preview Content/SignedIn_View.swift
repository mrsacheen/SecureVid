//
//  SignedIn_View.swift
//  SecureVid
//
//  Created by Sachin Khanal on 3/11/20.
//  Copyright © 2020 Sachin Khanal. All rights reserved.
//

import SwiftUI

struct SignedIn_View: View {
    @EnvironmentObject var session: SessionStore
    func getUser(){
        session.listen()
    }
    var body: some View {
       // Text("Welcome \( getuid())")
        VStack{
            Text("Welcome back \(session.session!.email ?? "user")")
                       Button(action: session.signOut){
                       Text("Sign Out")
               }
        }
       
    }
}
struct SignedIn_View_Previews: PreviewProvider {
    static var previews: some View {
        SignedIn_View()
    }
}
