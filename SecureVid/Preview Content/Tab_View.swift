//
//  Tab_View.swift
//  SecureVid
//
//  Created by Sachin Khanal on 3/13/20.
//  Copyright © 2020 Sachin Khanal. All rights reserved.
//

import SwiftUI

struct Tab_View: View {
     @State var profile: UserProfile?
    @EnvironmentObject var session: SessionStore
    func getUser(){
        session.listen()
    }
    var body: some View {
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
}

struct Tab_View_Previews: PreviewProvider {
    static var previews: some View {
        Tab_View().environmentObject(SessionStore())
    }
}
