//
//  CameraView.swift
//  SecureVid
//
//  Created by Sachin Khanal on 3/21/20.
//  Copyright © 2020 Sachin Khanal. All rights reserved.
//

import SwiftUI
import AVFoundation

struct Camera_View: View {
    @State var isShowingCameraView = false
    
    var body: some View {
        NavigationView{
            VStack {
                Button(action : {
                    print("Button Pressed")
                    self.isShowingCameraView.toggle()
                }, label : {
                    Text("Show Camera Preview")
                })
                
                CameraView()
                    .edgesIgnoringSafeArea(.all)
                
            }
        }
        
    }
}
struct CameraView : UIViewControllerRepresentable {
    // Init your ViewController
    func makeUIViewController(context: UIViewControllerRepresentableContext<CameraView>) -> UIViewController {
        let controller = CameraViewController()
        return controller
    }
    
    
    // Tbh no idea what to do here
    func updateUIViewController(_ uiViewController: CameraView.UIViewControllerType, context: UIViewControllerRepresentableContext<CameraView>) {
        
    }
}

// My custom class which inits an AVSession for the live preview
class CameraViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCamera()
    }
    
    func loadCamera() {
        let avSession = AVCaptureSession()
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device : captureDevice) else { return }
        avSession.addInput(input)
        avSession.startRunning()
        
        let cameraPreview = AVCaptureVideoPreviewLayer(session: avSession)
        view.layer.addSublayer(cameraPreview)
        cameraPreview.frame = view.frame
        cameraPreview.videoGravity = .resizeAspectFill
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        Camera_View()
    }
}
