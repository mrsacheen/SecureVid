//
//  UIView.swift
//  SecureVid
//
//  Created by Sachin Khanal on 3/11/20.
//  Copyright © 2020 Sachin Khanal. All rights reserved.
//

import SwiftUI

struct UIView: View {
    @EnvironmentObject var session: SessionStore
    func getUser(){
        session.listen()
    }
    var body: some View {
        Text("Welcome\(getuid())")
    }
}

struct UIView_Previews: PreviewProvider {
    static var previews: some View {
        UIView()
    }
}
