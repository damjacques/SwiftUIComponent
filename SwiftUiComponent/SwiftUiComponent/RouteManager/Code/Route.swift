//
//  Route.swift
//  SwiftUIComponent
//
//  Created by Damien JACQUES on 19/04/2022.
//

import SwiftUI


class Route{
    
    /// Init Route use diferent id if same id than an other route the transition can be not shown
    /// - Parameters:
    ///   - id: The id of route is used for view id too (Mandatory)
    ///   - view: View display (Mandatory)
    ///   - transitionIn: Transition of view when is show (default enterSlide)
    ///   - transitionOut: Transition of view when is pop (default backSlide)
    init(id:String,view:AnyView,transitionIn:AnyTransition = .enterSlide,transitionOut:AnyTransition = .backSlide){
        self.id = id
        self.view = view
        self.transitionIn = transitionIn
        self.transitionOut = transitionOut
    }
    
    var id: String
    var view: AnyView
    var isBack: Bool = false
    var transitionIn:AnyTransition
    var transitionOut:AnyTransition
    
    /// View display
    /// - Returns: View with transition and with id.
    func getView() -> some View{
        return view.id(id).transition(self.isBack ? self.transitionOut : self.transitionIn)
    }
    
}

extension Route: Equatable {
    static func == (lhs: Route, rhs: Route) -> Bool {
        return lhs.id == rhs.id
    }
    
}

