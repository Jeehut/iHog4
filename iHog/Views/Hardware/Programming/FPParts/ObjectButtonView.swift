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
                FPButton(buttonText: "Live", buttonFunction: "live")
                FPButton(buttonText: "Scene", buttonFunction: "scene")
                FPButton(buttonText: "Cue", buttonFunction: "cue")
            }
            HStack{
                FPButton(buttonText: "Macro", buttonFunction: "macro")
                FPButton(buttonText: "List", buttonFunction: "list")
                FPButton(buttonText: "Page", buttonFunction: "page")
            }
        }
    }
}

struct ObjectButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectButtonView()
    }
}
