//
//  KindButtonView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/24/20.
//

import SwiftUI

struct KindButtonView: View {
    @EnvironmentObject var osc: OSCHelper
    var body: some View {
        VStack(spacing: 1){
            HStack(spacing: 1){
                FPButton(buttonText: "Intens", buttonFunction: ButtonFunctionNames.intensity)
                FPButton(buttonText: "Positn", buttonFunction: ButtonFunctionNames.position)
                FPButton(buttonText: "Colour", buttonFunction: ButtonFunctionNames.colour)
                FPButton(buttonText: "Beam", buttonFunction: ButtonFunctionNames.beam)
            }
            HStack(spacing: 1){
                FPButton(buttonText: "Effect", buttonFunction: ButtonFunctionNames.effect)
                FPButton(buttonText: "Time", buttonFunction: ButtonFunctionNames.time)
                FPButton(buttonText: "Group", buttonFunction: ButtonFunctionNames.group)
                FPButton(buttonText: "Fixture", buttonFunction: ButtonFunctionNames.fixture)
            }
        }
    }
}

struct KindButtonView_Previews: PreviewProvider {
    static var previews: some View {
        KindButtonView()
    }
}
