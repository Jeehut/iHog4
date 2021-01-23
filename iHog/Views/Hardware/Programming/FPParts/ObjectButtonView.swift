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
                FPButton(buttonText: "Live", buttonFunction: ButtonNames.live.rawValue)
                FPButton(buttonText: "Scene", buttonFunction: ButtonNames.scene.rawValue)
                FPButton(buttonText: "Cue", buttonFunction: ButtonNames.cue.rawValue)
            }
            HStack{
                FPButton(buttonText: "Macro", buttonFunction: ButtonNames.macro.rawValue)
                FPButton(buttonText: "List", buttonFunction: ButtonNames.list.rawValue)
                FPButton(buttonText: "Page", buttonFunction: ButtonNames.page.rawValue)
            }
        }
    }
}

struct ObjectButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectButtonView()
    }
}
