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
                FPButton(buttonText: "Setup", buttonFunction: ButtonFunctionNames.setup.rawValue)
                FPButton(buttonText: "Goto", buttonFunction: ButtonFunctionNames.goto.rawValue)
                FPButton(buttonText: "Set", buttonFunction: ButtonFunctionNames.set.rawValue)
            }
            HStack{
                FPButton(buttonText: "Pig", buttonFunction: ButtonFunctionNames.pig.rawValue)
                FPButton(buttonText: "Fan", buttonFunction: ButtonFunctionNames.fan.rawValue)
                FPButton(buttonText: "Open", buttonFunction: ButtonFunctionNames.open.rawValue)
            }
        }
    }
}

struct UtilityButtonView_Previews: PreviewProvider {
    static var previews: some View {
        UtilityButtonView()
    }
}
