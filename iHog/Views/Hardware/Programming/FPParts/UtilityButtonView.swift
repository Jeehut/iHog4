//
//  UtilityButtonView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/24/20.
//

import SwiftUI

struct UtilityButtonView: View {
    var body: some View {
        VStack{
            HStack{
                FPButton(buttonText: "Setup", buttonFunction: "setup")
                FPButton(buttonText: "Goto", buttonFunction: "goto")
                FPButton(buttonText: "Set", buttonFunction: "set")
            }
            HStack{
                FPButton(buttonText: "Pig", buttonFunction: "pig")
                FPButton(buttonText: "Fan", buttonFunction: "fan")
                FPButton(buttonText: "Open", buttonFunction: "open")
            }
        }
    }
}

struct UtilityButtonView_Previews: PreviewProvider {
    static var previews: some View {
        UtilityButtonView()
    }
}
