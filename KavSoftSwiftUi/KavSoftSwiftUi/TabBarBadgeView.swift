//
//  TabBarBadgeView.swift
//  KavSoftSwiftUi
//
//  Created by Dipak Dhondge on 08/07/20.
//  Copyright © 2020 Dipak Dhondge. All rights reserved.
//

import SwiftUI

struct TabBarBadgeView: View {
    var body: some View {
        GeometryReader{ geometry in
            //TabView
            TabView{
                ContentView()
                    .tabItem{
                      Image(systemName: "flame")
                        
                      Text("Menu")
                    }
              OrderView()
                .tabItem{
                        Image(systemName: "bag")
                        Text("Menu")
                    }
              CustomView()
                             .tabItem{
                                     Image(systemName: "waveform.path.ecg")
                                     Text("Menu")
                                 }
            }
            
        }
    }
}

struct TabBarBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarBadgeView()
    }
}

//MARK:- OrderView
struct OrderView: View {
    var body: some View {
          Text("Menu")
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}

// MARK:- CustomView List View
struct CustomView: View {
    let heros = [
          "Iron man","Thor","Spider-Man"
          ]
    var body : some View {
        NavigationView{
                ZStack{
                List(heros,id: \.self) { message in
                NavigationLink(destination: DetailView(message: message)){
                Text(message)
                    }
                }
            }
            .navigationBarTitle("Heros", displayMode: .inline)
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = .blue
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
            })
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CustomView_Previews: PreviewProvider {
static var previews: some View {
    CustomView()
}}

// MARK:- DetailView
struct DetailView: View {
   let message: String
    var body : some View {
        Text(message)
    }
}


// MARK:- Navigation Bar Customization Extension
struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

