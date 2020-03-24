//
//  SettingsView.swift
//  SecureVid
//
//  Created by Sachin Khanal on 3/13/20.
//  Copyright © 2020 Sachin Khanal. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    var userProfile: UserProfile
    @State var showSheet: Bool = false
    @EnvironmentObject var session: SessionStore
    @State private var image: UIImage?
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    //@State private var image: UIImage?
    //func alert(){
    //        let alert = UIAlertController(title: "Did you bring your towel?", message: "It's recommended you bring your towel before continuing.", preferredStyle: .alert)
    // }
    func getUser(){
        session.listen()
    }
    var body: some View {
        
        NavigationView{
            VStack{
                VStack {
                    
                    Image(uiImage: image ?? UIImage(named: "Camera")!)
                        .resizable()
                        .frame(width: 300, height: 300)
                    
                    Button("Choose Picture") {
                        self.showSheet = true
                    }.padding()
                        .actionSheet(isPresented: $showSheet) {
                            ActionSheet(title: Text("Select Photo"), message: Text("Choose"), buttons: [
                                .default(Text("Photo Library")) {
                                    self.showImagePicker = true
                                    self.sourceType = .photoLibrary
                                },
                                .default(Text("Camera")) {
                                    self.showImagePicker = true
                                    self.sourceType = .camera
                                },
                                .cancel()
                            ])
                    }
                    
                }
                Form{
                    //Text("Welcome back \(session.session!.email ?? "user")")
                    //Text(userProfile.uid)
                    Text(userProfile.firstName)
                    Text(userProfile.lastName)
                    Text(userProfile.city)
                    
                    //                       Button(action: session.signOut){
                    //                       Text("Sign Out")
                    //               }
                }
                //Text("This is an Account Page")
            }.navigationBarTitle("Account")
                .navigationBarItems(trailing: Button(action: {
                    self.session.signOut()
                }, label: {
                    Text("Sign Out")
                }))
            
        }.sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
            
            
        }
    }
        class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
            
            @Binding var image: UIImage?
            @Binding var isShown: Bool
            
            init(image: Binding<UIImage?>, isShown: Binding<Bool>) {
                _image = image
                _isShown = isShown
            }
            
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                
                if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                    image = uiImage
                    isShown = false
                }
                
            }
            
            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                isShown = false
            }
            
        }
        
        
        struct ImagePicker: UIViewControllerRepresentable {
            
            typealias UIViewControllerType = UIImagePickerController
            typealias Coordinator = ImagePickerCoordinator
            
            @Binding var image: UIImage?
            @Binding var isShown: Bool
            var sourceType: UIImagePickerController.SourceType = .camera
            
            func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
            }
            
            func makeCoordinator() -> ImagePicker.Coordinator {
                return ImagePickerCoordinator(image: $image, isShown: $isShown)
            }
            
            func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
                
                let picker = UIImagePickerController()
                picker.sourceType = sourceType
                picker.delegate = context.coordinator
                return picker
                
            }
        }
    
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        let userProfile = UserProfile(uid: "", firstName: "Sachin", lastName: "Friese", city: "Kathmandu")
        return SignedIn_View(userProfile: userProfile)
    }
}
