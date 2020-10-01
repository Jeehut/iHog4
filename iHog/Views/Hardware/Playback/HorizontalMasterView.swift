//
//  HorizontalMasterView.swift
//  iHog
//
//  Created by Maegan Wilson on 10/1/20.
//

import SwiftUI

struct HorizontalMasterView: View {
    var masterNumber: Int
    
    var body: some View {
        VStack{
            HStack{
                FPButton(buttonText: "\(masterNumber)")
                FPButton(buttonText: "Back")
                FPButton(buttonText: "Pause")
                FPButton(buttonText: "Play")
                FPButton(buttonText: "FLASH")
            }
            HStack{
                HorizontalSlider()
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
