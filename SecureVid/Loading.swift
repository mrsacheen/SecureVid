//
//  Loading.swift
//  SecureVid
//
//  Created by Sachin Khanal on 3/21/20.
//  Copyright © 2020 Sachin Khanal. All rights reserved.
//

import SwiftUI

struct Loading: View {
    var body: some View {
        ZStack{
          BlurView()
            VStack{
                Indicator()
                Text("Please Wait").foregroundColor(.white).padding(.top, 8)
            }
        .frame(width: 110, height: 110)
        .padding(10)
        .cornerRadius(80)
        }.edgesIgnoringSafeArea(.all)
    }
}
struct BlurView : UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIVisualEffectView {
        
        let effect = UIBlurEffect(style: .systemChromeMaterialDark)
        let view = UIVisualEffectView(effect: effect )
        return view
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<BlurView>) {
        //
    }
    
}
struct Indicator : UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<Indicator>) -> UIActivityIndicatorView {
        let indi = UIActivityIndicatorView(style: .large)
        indi.color = UIColor.white
        indi.startAnimating()
        return indi
        
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator>) {
       //
    }
}
struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        Loading()
    }
}
