//
//  FriendSwiftUIView.swift
//  calhacks-2019
//
//  Created by Aubhro Sengupta on 10/27/19.
//  Copyright © 2019 protonhackers. All rights reserved.
//

import SwiftUI

struct FriendSwiftUIView: View {
    var friends: [Friend]
    var body: some View {
        List(0 ..< friends.count) { item in
            Image(uiImage: self.friends[item].image)
            VStack(alignment: .leading) {
                Text(self.friends[item].name)
                Text(String(format: "%.2f", self.friends[item].distance) + "m")
                    .font(.subheadline)
            }
        }
    }
}

struct FriendSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        let friends = [
            Friend(name: "Rohan", distance: 2.0, imagePath: "https://randomuser.me/api/portraits/thumb/men/0.jpg"),
            Friend(name: "Vikranth", distance: 2.3, imagePath: "https://randomuser.me/api/portraits/thumb/men/0.jpg")
            
        ]
        return FriendSwiftUIView(friends:friends)
    }
}
