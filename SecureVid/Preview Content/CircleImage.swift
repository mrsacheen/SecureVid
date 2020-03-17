//
//  CircleImage.swift
//  SecureVid
//
//  Created by Sachin Khanal on 3/10/20.
//  Copyright © 2020 Sachin Khanal. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        VStack{
               // .bold()
            Image("Camera")
            .resizable()
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 1) )
            .shadow(radius: 10)
        }
        
       // Text("Hello")
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
