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
    func getUser(){
        session.listen()
    }
    var body: some View{
        
        Group{
            // {
                //}
            if (session.session != nil){
                
                SignedIn_View()
                    
                }
            
            else{
                AuthView()
            }
        }.onAppear(perform: getUser)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        ContentView().environmentObject(SessionStore())
    }
}
