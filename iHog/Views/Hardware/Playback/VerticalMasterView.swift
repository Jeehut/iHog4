//
//  MasterView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/30/20.
//

import SwiftUI

struct VerticalMasterView: View {
    var masterNumber: Int
    
    var body: some View {
        VStack{
            FPButton(buttonText: "\(masterNumber)")
            FPButton(buttonText: "Play")
            FPButton(buttonText: "Pause")
            FPButton(buttonText: "Back")
            VerticalSlider()
            FPButton(buttonText: "")
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalMasterView(masterNumber: 1)
    }
}
