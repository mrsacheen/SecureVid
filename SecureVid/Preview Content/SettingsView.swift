//
//  SettingsView.swift
//  SecureVid
//
//  Created by Sachin Khanal on 3/13/20.
//  Copyright © 2020 Sachin Khanal. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var session: SessionStore
       func getUser(){
           session.listen()
       }
    var body: some View {
        NavigationView{
            VStack{
                Button(action: session.signOut){
                        Text("Sign Out")
                }
            }.navigationBarTitle("Account")

        }
                  
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
