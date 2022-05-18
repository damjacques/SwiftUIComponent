//
//  RouteManager.swift
//  SwiftUIComponent
//
//  Created by Damien JACQUES on 19/04/2022.
//

import SwiftUI

class RouteManager:ObservableObject{
    
    /// Init RouteManager
    /// - Parameter initialRoute: the first route display when launch (Mandatory)
    init(initialRoute:Route){
        routeStack = [initialRoute]
    }
    
    @Published var routeStack:[Route]
    
    /// Set the stack of routes (like navigationController.setViewControllers)
    /// - Parameters:
    ///   - routes: new stack of routes
    ///   - animated: Display animation or not (Default true)
    func set(routes:[Route],animated:Bool = true){
        if(animated){
            withAnimation {
                setRoutes(routes: routes)
            }
        }else{
            setRoutes(routes: routes)
        }
    }
    
    private func setRoutes(routes:[Route]){
        routeStack = routes
    }
    
    /// Push new route tothe stack (like navigationController.pushViewController)
    /// - Parameters:
    ///   - route: new Route to display
    ///   - animated: Display animation or not (Default true)
    func push(route:Route,animated:Bool = true){
        if(animated){
            withAnimation {
                pushRoute(route: route)
            }
        }else{
            pushRoute(route: route)
        }
        
    }
    
    private func pushRoute(route:Route){
        routeStack.append(route)
    }
    
    /// Remove current display Route if more than one Route in stack (like navigationController.popViewController)
    /// /// - Parameter animated: Display animation or not (Default true)
    func pop(animated:Bool = true){
        if routeStack.count > 1{
            if(animated){
                withAnimation {
                    popRoute()
                }
            }else{
                popRoute()
            }
            
        }
    }
    
    private func popRoute(){
        routeStack.removeLast()
        routeStack.last?.isBack = true
    }
    
    /// Remove all Route up to the one with the correct id if more than one Route in stack (like navigationController.popToViewController)
    /// - Parameters:
    ///   - routeId: Route id wanted
    ///   - animated: Display animation or not (Default true)
    func popTo(routeId:String,animated:Bool = true){
        if let route = routeStack.last(where: { route in
            route.id == routeId
        }){
            popTo(route: route,animated: animated)
        }
    }
    
    /// Remove all Route up to the one requested if more than one Route in stack (like navigationController.popToViewController)
    /// - Parameters:
    ///   - route: Route wanted
    ///   - animated: Display animation or not (Default true)
    func popTo(route:Route,animated:Bool = true){
        var find = !routeStack.contains { routeLs in routeLs == route}
        while routeStack.count > 1 && !find {
            if let lastRoute = routeStack.last{
                if(lastRoute == route){
                    find = true
                }else{
                    pop(animated: animated)
                }
            }
        }
    }
    
    /// Remove all Route up to the first (like navigationController.popToRootViewController)
    /// - Parameter animated: Display animation or not (Default true)
    func popToRoot(animated:Bool = true){
        if let root = routeStack.first{
            popTo(route: root,animated: animated)
        }
    }
    
    /// Return a Bool if need to display back
    /// - Returns: Bool
    func needDisplayBack() -> Bool{
        return routeStack.count > 1
    }
    
}

