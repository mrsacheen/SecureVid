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
                CircleImage()
                VStack{
                    LoginPage()
                    //Spacer(minLength: 1)
                    HStack(){
                        Text("Already have an account?")
                            .foregroundColor(.purple)
                    NavigationLink(destination: SignupPage()) {
                        Text("SignUp")
                            .fontWeight(.semibold)
                            .font(.title)
                            .padding()
                            .foregroundColor(.purple)
                            //.frame(width: 130.0)
                            //.background(LinearGradient(gradient: Gradient(colors: [Color(.purple),Color(.blue)]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(40)
                    }
                   // Spacer(minLength: 30)
                }
                }
                
            }
            .padding()
        }
        .padding(.bottom, -38.0)
    }
}
struct AuthView : View{
    var body : some View{
        NavigationView{
            HomeView()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView().environmentObject(SessionStore())
    }
}
