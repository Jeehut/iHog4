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
                FPButton(buttonText: "Intens", buttonFunction: "intensity")
                FPButton(buttonText: "Positn", buttonFunction: "position")
                FPButton(buttonText: "Colour", buttonFunction: "colour")
                FPButton(buttonText: "Beam", buttonFunction: "beam")
            }
            HStack{
                FPButton(buttonText: "Effect", buttonFunction: "effect")
                FPButton(buttonText: "Time", buttonFunction: "time")
                FPButton(buttonText: "Group", buttonFunction: "group")
                FPButton(buttonText: "Fixture", buttonFunction: "fixture")
            }
        }
    }
}

struct KindButtonView_Previews: PreviewProvider {
    static var previews: some View {
        KindButtonView()
    }
}
