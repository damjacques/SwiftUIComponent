//
//  RouteView.swift
//  SwiftUIComponent
//
//  Created by Damien JACQUES on 19/04/2022.
//

import SwiftUI

struct RouteView: View {
    
    @EnvironmentObject var routeManager: RouteManager
    
    var body: some View {
        routeManager.routeStack.last?.getView()
    }
}

struct RouteView_Previews: PreviewProvider {
    static var previews: some View {
        RouteView()
    }
}
