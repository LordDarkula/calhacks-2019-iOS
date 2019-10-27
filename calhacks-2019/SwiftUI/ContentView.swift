//
//  ContentView.swift
//  calhacks-2019
//
//  Created by Aubhro Sengupta on 10/26/19.
//  Copyright © 2019 protonhackers. All rights reserved.
//

import SwiftUI
import SwiftyJSON

struct ContentView: View {
    @State var phone_number: String = ""
    @State var username: String = ""
    @State private var action: Int? = 0
    var body: some View {
        NavigationView{
        VStack{

            TextField("Enter your phone number", text: $phone_number)
.frame(maxWidth: 200, maxHeight: 75)
            TextField("Enter your username", text: $username)
                .frame(maxWidth: 200, maxHeight: 75)
            NavigationLink(destination: ARSwiftUIView(), tag: 1, selection: $action) {
                EmptyView()
            }
                Text("Sign In")
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius:40).stroke(Color.green, lineWidth: 5)).onTapGesture {
                        if self.username.count > 0 { Login.login(number: self.phone_number, username: self.username, completion: { data in (JSON).self
                                self.action = 1
                            
                        })
                        }
                }
                
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



