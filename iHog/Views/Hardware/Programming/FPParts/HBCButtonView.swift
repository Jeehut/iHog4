//
//  HBCButtonView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/25/20.
//

import SwiftUI

struct HBCButtonView: View {
    var body: some View {
        HStack{
            FPButton(buttonText: "Blind", buttonFunction: .blind)
            FPButton(buttonText: "High Light", buttonFunction: .highlight)
            FPButton(buttonText: "Clear", buttonFunction: .clear)
        }
    }
}

struct HBCButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HBCButtonView()
    }
}
