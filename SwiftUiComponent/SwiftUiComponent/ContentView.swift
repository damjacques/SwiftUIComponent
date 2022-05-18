//
//  ContentView.swift
//  SwiftUIComponent
//
//  Created by Damien JACQUES on 19/04/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                HStack{
                    NavigationLink(destination:RouteExampleView()){
                        Text("Route Manager")
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
