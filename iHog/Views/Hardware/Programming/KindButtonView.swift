//
//  KindButtonView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/24/20.
//

import SwiftUI

struct KindButtonView: View {
    var body: some View {
        VStack{
            HStack{
                FPButton(buttonText: "Intens")
                FPButton(buttonText: "Positn")
                FPButton(buttonText: "Colour")
                FPButton(buttonText: "Beam")
            }
            HStack{
                FPButton(buttonText: "Effect")
                FPButton(buttonText: "Time")
                FPButton(buttonText: "Group")
                FPButton(buttonText: "Fixture")
            }
        }
    }
}

struct KindButtonView_Previews: PreviewProvider {
    static var previews: some View {
        KindButtonView()
    }
}
