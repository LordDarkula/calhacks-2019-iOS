//
//  ContentView.swift
//  calhacks-2019
//
//  Created by Aubhro Sengupta on 10/26/19.
//  Copyright © 2019 protonhackers. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    @State var phone: String = ""
    @State var password: String = ""
    var body: some View {
        VStack{
            TextField("Enter your phone number", text: $phone)
                .frame(maxWidth: 200, maxHeight: 75)
            TextField("Enter your password", text: $password)
                .frame(maxWidth: 200, maxHeight: 75)
            Button(action: {
               //Login action
             
            }) {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



