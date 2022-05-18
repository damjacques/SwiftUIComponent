//
//  ViewCount.swift
//  SwiftUIComponent
//
//  Created by Damien JACQUES on 20/04/2022.
//

import SwiftUI

struct ViewCount: View {
    @Binding var count : Int
    
    //need to set EnvironementObject on all View where you need it
    @EnvironmentObject var routeManager: RouteManager
    
    var body: some View {
        VStack {
            Text("View Count : \(count)")
            Button("Go next") {
                let next = count + 1
                routeManager.push(route: Route(id: "ViewCount\(next)", view: AnyView(ViewCount(count: .constant(next)))))
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity).navigationBarBackButtonHidden(true).navigationBarItems(
            leading:Button(action : {self.routeManager.pop()}){Text("Cancel")}.hidden(!routeManager.needDisplayBack()))
    }
}

struct ViewCount_Previews: PreviewProvider {
    static var previews: some View {
        ViewCount(count: .constant(0))
    }
}
