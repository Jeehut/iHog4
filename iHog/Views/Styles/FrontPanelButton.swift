//
//  FrontPanelButton.swift
//  iHog
//
//  Created by Maegan Wilson on 10/12/21.
//

import Foundation
import SwiftUI

struct FrontPanelButton: ButtonStyle {
    var backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 65,
                   minHeight: 65,
                   alignment: .center)
            .padding(HALF_PADDING)
            .foregroundColor(.primary)
            .background(backgroundColor)
            .cornerRadius(BASE_CORNER_RADIUS)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

//struct GrowingButton: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .padding()
//            .background(Color.blue)
//            .foregroundColor(.white)
//            .clipShape(Capsule())
//            .scaleEffect(configuration.isPressed ? 1.2 : 1)
//            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
//    }
//}
