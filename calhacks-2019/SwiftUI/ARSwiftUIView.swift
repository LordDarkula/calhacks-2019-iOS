//
//  ARSwiftUIView.swift
//  calhacks-2019
//
//  Created by Aubhro Sengupta on 10/26/19.
//  Copyright © 2019 protonhackers. All rights reserved.
//

import SwiftUI

struct ARViewControllerWrapper: UIViewControllerRepresentable {

    typealias UIViewControllerType = ARViewController


    func makeUIViewController(context: UIViewControllerRepresentableContext<ARViewControllerWrapper>) -> ARViewControllerWrapper.UIViewControllerType {
        return ARViewController()
    }

    func updateUIViewController(_ uiViewController: ARViewControllerWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<ARViewControllerWrapper>) {
        //
    }
}

struct ARSwiftUIView: View {
    var body: some View {
        ARViewControllerWrapper()
    }
}

struct ARSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ARSwiftUIView()
    }
}
