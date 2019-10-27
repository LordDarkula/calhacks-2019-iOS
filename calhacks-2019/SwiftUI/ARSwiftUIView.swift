//
//  ARSwiftUIView.swift
//  calhacks-2019
//
//  Created by Aubhro Sengupta on 10/26/19.
//  Copyright © 2019 protonhackers. All rights reserved.
//

import SwiftUI

struct ARViewControllerWrapper: UIViewControllerRepresentable {
    
    let phoneNumber: String
    let username: String

    typealias UIViewControllerType = ARViewController


    func makeUIViewController(context: UIViewControllerRepresentableContext<ARViewControllerWrapper>) -> ARViewControllerWrapper.UIViewControllerType {
        let arVC =  ARViewController()
        arVC.phoneNumber = phoneNumber
        arVC.username = username
        return arVC
    }

    func updateUIViewController(_ uiViewController: ARViewControllerWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<ARViewControllerWrapper>) {
        //
    }
}

struct ARSwiftUIView: View {
    let phoneNumber: String
    let username: String
    
    var body: some View {
        ARViewControllerWrapper(phoneNumber: phoneNumber, username: username)
    }
}

struct ARSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ARSwiftUIView(phoneNumber: "", username: "")
    }
}
