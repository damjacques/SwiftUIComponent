//
//  RouteExampleApp.swift
//  SwiftUIComponent
//
//  Created by Damien JACQUES on 20/04/2022.
//

import SwiftUI


struct RouteExampleApp: App {
    
    @StateObject var routeManager = RouteManager(initialRoute: Route(id: "ViewCount", view: AnyView(ViewCount(count: .constant(0)))))
    
    var body: some Scene {
        WindowGroup {
            RouteView().environmentObject(routeManager)
        }
    }
}
