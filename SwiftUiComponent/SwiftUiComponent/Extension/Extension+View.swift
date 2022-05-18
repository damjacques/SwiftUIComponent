//
//  Extension+View.swift
//  SwiftUIComponent
//
//  Created by Damien JACQUES on 20/04/2022.
//

import SwiftUI

extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}
