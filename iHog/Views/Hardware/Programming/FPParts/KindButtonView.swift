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
        VStack{
            HStack{
                FPButton(buttonText: "Intens", buttonFunction: ButtonFunctionNames.intensity.rawValue)
                FPButton(buttonText: "Positn", buttonFunction: ButtonFunctionNames.position.rawValue)
                FPButton(buttonText: "Colour", buttonFunction: ButtonFunctionNames.colour.rawValue)
                FPButton(buttonText: "Beam", buttonFunction: ButtonFunctionNames.beam.rawValue)
            }
            HStack{
                FPButton(buttonText: "Effect", buttonFunction: ButtonFunctionNames.effect.rawValue)
                FPButton(buttonText: "Time", buttonFunction: ButtonFunctionNames.time.rawValue)
                FPButton(buttonText: "Group", buttonFunction: ButtonFunctionNames.group.rawValue)
                FPButton(buttonText: "Fixture", buttonFunction: ButtonFunctionNames.fixture.rawValue)
            }
        }
    }
}

struct KindButtonView_Previews: PreviewProvider {
    static var previews: some View {
        KindButtonView()
    }
}
