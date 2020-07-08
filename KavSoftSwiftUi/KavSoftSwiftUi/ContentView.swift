//
//  ContentView.swift
//  KavSoftSwiftUi
//
//  Created by Dipak Dhondge on 02/07/20.
//  Copyright © 2020 Dipak Dhondge. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            customButton()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//  MARK:- CustomView List View
struct customButton:View{
    @State var count = 0
    var body : some View {
        ZStack{
            Button(action: {
                self.count += 1
             print("clicked")
  
            }) {
             Image(systemName: "bell.fill").resizable().frame(width: 40, height: 40)
                 }.padding()
                  .foregroundColor(Color.white)
                 .background(Color.green)
                 .clipShape(Circle())
                 
            if count != 0{
Text("\(count)").padding(6).background(Color.black).clipShape(Circle()).foregroundColor(.white).offset(x:10,y:-30)
            }
              
        }.animation(.spring())


}}
