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
            FPButton(buttonText: "\(masterNumber)", buttonFunction: "choose", buttonNumber: masterNumber)
            FPButton(buttonText: "Play", buttonFunction: "go", buttonNumber: masterNumber)
            FPButton(buttonText: "Pause", buttonFunction: "pause", buttonNumber: masterNumber)
            FPButton(buttonText: "Back", buttonFunction: "goback", buttonNumber: masterNumber)
            VerticalSlider(master: masterNumber)
            FPButton(buttonText: "FLASH", buttonFunction: "flash", buttonNumber: masterNumber)
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalMasterView(masterNumber: 1)
    }
}
