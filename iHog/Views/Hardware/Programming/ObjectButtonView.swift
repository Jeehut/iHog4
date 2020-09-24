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
                FPButton(buttonText: "Live")
                FPButton(buttonText: "Scene")
                FPButton(buttonText: "Cue")
            }
            HStack{
                FPButton(buttonText: "Macro")
                FPButton(buttonText: "List")
                FPButton(buttonText: "Page")
            }
        }
    }
}

struct ObjectButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectButtonView()
    }
}
