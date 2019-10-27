//
//  ContentView.swift
//  calhacks-2019
//
//  Created by Aubhro Sengupta on 10/26/19.
//  Copyright © 2019 protonhackers. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var phone_number: String = ""
    @State var username: String = ""
    var body: some View {
        NavigationView{
        VStack{

            TextField("Enter your phone number", text: $phone_number)
.frame(maxWidth: 200, maxHeight: 75)
            TextField("Enter your username", text: $username)
                .frame(maxWidth: 200, maxHeight: 75)
            NavigationLink(destination: ARSwiftUIView(phoneNumber: phone_number, username: username)) {
 
                Text("Sign In")
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .padding(10)
                .overlay(RoundedRectangle(cornerRadius:40).stroke(Color.green, lineWidth: 5))
                
                
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



