//
//  Extension+AnyTransition.swift
//  SwiftUIComponent
//
//  Created by Damien JACQUES on 19/04/2022.
//

import SwiftUI

extension AnyTransition {
    static var enterSlide: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading))}
    static var backSlide: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .leading),
            removal: .move(edge: .trailing))}
}
