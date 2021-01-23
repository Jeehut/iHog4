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
            FPButton(buttonText: "Back", buttonFunction: ButtonFunctionNames.back.rawValue)
            FPButton(buttonText: "All", buttonFunction: ButtonFunctionNames.all.rawValue)
            FPButton(buttonText: "Next", buttonFunction: ButtonFunctionNames.next.rawValue)
        }
    }
}

struct SelectButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SelectButtonView()
    }
}
