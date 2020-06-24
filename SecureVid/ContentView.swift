//
//  ContentView.swift
//  SecureVid
//
//  Created by Sachin Khanal on 3/10/20.
//  Copyright © 2020 Sachin Khanal. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    var body: some View{
        ZStack{
            AuthenticationView()
            Text("Hello World")
        }
        
        //CameraView()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        ContentView().environmentObject(SessionStore())
    }
}
