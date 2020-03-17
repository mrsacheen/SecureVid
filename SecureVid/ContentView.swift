//
//  ContentView.swift
//  SecureVid
//
//  Created by Sachin Khanal on 3/10/20.
//  Copyright © 2020 Sachin Khanal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    @State var profile: UserProfile?
    func getUser(){
        session.listen()
    }
    var body: some View{
        //NavigationView{
            Group{
                // {
                    //}
                if (session.session != nil){
                    
                    Tab_View()
                        
                    }
                
                else{
                    LoginPage()
                }
            }.onAppear(perform: getUser)
            
        }
        
    }
//}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        ContentView().environmentObject(SessionStore())
    }
}
