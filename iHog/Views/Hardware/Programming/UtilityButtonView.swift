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
                FPButton(buttonText: "Setup")
                FPButton(buttonText: "Goto")
                FPButton(buttonText: "Set")
            }
            HStack{
                FPButton(buttonText: "Pig")
                FPButton(buttonText: "Fan")
                FPButton(buttonText: "Open")
            }
        }
    }
}

struct UtilityButtonView_Previews: PreviewProvider {
    static var previews: some View {
        UtilityButtonView()
    }
}
