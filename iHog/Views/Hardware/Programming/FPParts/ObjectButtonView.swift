//
//  ObjectButtonView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/24/20.
//

import SwiftUI

struct ObjectButtonView: View {
    var body: some View {
        VStack{
            HStack{
                FPButton(buttonText: "Live", buttonFunction: ButtonFunctionNames.live.rawValue)
                FPButton(buttonText: "Scene", buttonFunction: ButtonFunctionNames.scene.rawValue)
                FPButton(buttonText: "Cue", buttonFunction: ButtonFunctionNames.cue.rawValue)
            }
            HStack{
                FPButton(buttonText: "Macro", buttonFunction: ButtonFunctionNames.macro.rawValue)
                FPButton(buttonText: "List", buttonFunction: ButtonFunctionNames.list.rawValue)
                FPButton(buttonText: "Page", buttonFunction: ButtonFunctionNames.page.rawValue)
            }
        }
    }
}

struct ObjectButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectButtonView()
    }
}
