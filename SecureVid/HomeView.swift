//
//  AuthView.swift
//  SecureVid
//
//  Created by Sachin Khanal on 3/11/20.
//  Copyright © 2020 Sachin Khanal. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var session: SessionStore
    var body: some View {
        NavigationView{
            VStack {
                //CircleImage()
                VStack{
                    LoginPage()
                    //Spacer(minLength: 1)
                    
                }
                
            }
            
        }
        
    }
}
struct AuthView : View{
    var body : some View{
        NavigationView{
            LoginPage()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView().environmentObject(SessionStore())
    }
}
