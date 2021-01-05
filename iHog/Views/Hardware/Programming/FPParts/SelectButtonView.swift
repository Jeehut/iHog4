//
//  SelectButtonView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/25/20.
//

import SwiftUI

struct SelectButtonView: View {
    var body: some View {
        HStack{
            FPButton(buttonText: "Back", buttonFunction: "back")
            FPButton(buttonText: "All", buttonFunction: "all")
            FPButton(buttonText: "Next", buttonFunction: "next")
        }
    }
}

struct SelectButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SelectButtonView()
    }
}
