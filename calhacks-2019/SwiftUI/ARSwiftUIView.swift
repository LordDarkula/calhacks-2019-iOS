//
//  ARSwiftUIView.swift
//  calhacks-2019
//
//  Created by Aubhro Sengupta on 10/26/19.
//  Copyright © 2019 protonhackers. All rights reserved.
//

import SwiftUI
import SwiftyJSON

struct ARViewControllerWrapper: UIViewControllerRepresentable {

    typealias UIViewControllerType = ARViewController
    var friendId: String

    func makeUIViewController(context: UIViewControllerRepresentableContext<ARViewControllerWrapper>) -> ARViewControllerWrapper.UIViewControllerType {
        let ar = ARViewController()
        ar.friendId = friendId
        return ar
    }

    func updateUIViewController(_ uiViewController: ARViewControllerWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<ARViewControllerWrapper>) {
        //
    }
}

struct ARSwiftUIView: View {
    var friendId: String
    
    
    var body: some View {
        ARViewControllerWrapper(friendId: friendId)
    }
}

//struct ARSwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        ARSwiftUIView(friedId)
//    }
//}
