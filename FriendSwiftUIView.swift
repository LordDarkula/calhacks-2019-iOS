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
    
    var body: some View {
        List(fetcher.friends) { friend in
            Image(uiImage: friend.image)
            VStack(alignment: .leading) {
                Text(friend.name)
                Text(String(format: "%.2f", friend.distance) + "m")
                    .font(.subheadline)
            }
        }
    }
}

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