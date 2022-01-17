//
//  HorizontalMasterView.swift
//  iHog
//
//  Created by Maegan Wilson on 10/1/20.
//

import SwiftUI

struct HorizontalMasterView: View {
    @EnvironmentObject var osc: OSCHelper

    var masterNumber: Int
    
    var body: some View {
        VStack{
            HStack{
                FPButton(buttonText: "\(masterNumber)", buttonFunction: .choose, buttonNumber: masterNumber)
                FPButton(buttonText: "Back", buttonFunction: .goback, buttonNumber: masterNumber)
                FPButton(buttonText: "Pause", buttonFunction: .pause, buttonNumber: masterNumber)
                FPButton(buttonText: "Play", buttonFunction: .go, buttonNumber: masterNumber)
                FPButton(buttonText: "FLASH", buttonFunction: .flash, buttonNumber: masterNumber, bgColor: osc.flashes[masterNumber])
            }
            HStack{
                HorizontalSlider(master: masterNumber)
            }
            HStack {
            }
        }
    }
}

struct HorizontalMasterView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView{
            HorizontalMasterView(masterNumber: 1)
            HorizontalMasterView(masterNumber: 2)
            HorizontalMasterView(masterNumber: 3)
            HorizontalMasterView(masterNumber: 4)
            HorizontalMasterView(masterNumber: 5)
            HorizontalMasterView(masterNumber: 6)
            HorizontalMasterView(masterNumber: 1)
            HorizontalMasterView(masterNumber: 1)
            HorizontalMasterView(masterNumber: 1)
            HorizontalMasterView(masterNumber: 1)
        }
    }
}
