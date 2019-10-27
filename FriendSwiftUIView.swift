//
//  FriendSwiftUIView.swift
//  calhacks-2019
//
//  Created by Aubhro Sengupta on 10/27/19.
//  Copyright © 2019 protonhackers. All rights reserved.
//

import SwiftUI

struct FriendSwiftUIView: View {
    @ObservedObject var fetcher = FetchFriends()
    let friends = [
        Friend(friendId: "4", name: "Rohan", distance: 2.0, imagePath: "https://randomuser.me/api/portraits/thumb/men/0.jpg"),
        Friend(friendId: "5", name: "Vikranth", distance: 2.3, imagePath: "https://randomuser.me/api/portraits/thumb/men/1.jpg"),
        Friend(friendId: "4", name: "Bhuvan", distance: 2.3, imagePath: "https://randomuser.me/api/portraits/thumb/men/2.jpg"),
        Friend(friendId: "7", name: "Frank", distance: 2.3, imagePath: "https://randomuser.me/api/portraits/thumb/men/3.jpg"),
        Friend(friendId: "13", name: "Aubhro", distance: 2.3, imagePath: "https://randomuser.me/api/portraits/thumb/men/4.jpg"),
        Friend(friendId: "9", name: "Rohan2", distance: 2.3, imagePath: "https://randomuser.me/api/portraits/thumb/men/5.jpg"),
        Friend(friendId: "10", name: "Kuppili", distance: 2.3, imagePath: "https://randomuser.me/api/portraits/thumb/men/6.jpg")
           
    ]
    
    var body: some View {
        NavigationView {
            List(0 ..< friends.count) { item in
                Image(uiImage: self.friends[item].image)
                VStack(alignment: .leading) {
                    NavigationLink(destination: ARSwiftUIView(friendId: self.friends[item].friendId)) {
                    Text(self.friends[item].name)
                    Text(String(format: "%.2f", self.friends[item].distance) + "m")
                        .font(.subheadline)
                    }
                }
            }
//        List(friends) { friend  in
//            Image(uiImage: friend.image)
//            Text(verbatim: friend.name)
//            NavigationLink(destination: ARSwiftUIView(friendId: friend.friendId)) {
//                Text(verbatim: String(format: "%.2f", friend.distance) + "m")
//                    .font(.subheadline)
//            }
//            }.navigationBarTitle("FRIENDS")
//        }
    }
}
//
//struct FriendSwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        let friends = [
//            Friend(name: "Rohan", distance: 2.0, imagePath: "https://randomuser.me/api/portraits/thumb/men/0.jpg"),
//            Friend(name: "Vikranth", distance: 2.3, imagePath: "https://randomuser.me/api/portraits/thumb/men/0.jpg")
//
//        ]
//        return FriendSwiftUIView(friends:friends)
//    }
//}
}
