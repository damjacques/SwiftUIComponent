//
//  RouteExampleView.swift
//  SwiftUIComponent
//
//  Created by Damien JACQUES on 20/04/2022.
//

import SwiftUI

struct RouteExampleView: View {
    
    @StateObject var routeManager = RouteManager(initialRoute: Route(id: "ViewCount", view: AnyView(ViewCount(count: .constant(0)))))
    
    var body: some View {
        RouteView().environmentObject(routeManager)
    }
}

struct RouteExampleView_Previews: PreviewProvider {
    static var previews: some View {
        RouteExampleView()
    }
}
