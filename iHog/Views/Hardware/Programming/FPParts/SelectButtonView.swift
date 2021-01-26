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
            FPButton(buttonText: "Back", buttonFunction: ButtonFunctionNames.back)
            FPButton(buttonText: "All", buttonFunction: ButtonFunctionNames.all)
            FPButton(buttonText: "Next", buttonFunction: ButtonFunctionNames.next)
        }
    }
}

struct SelectButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SelectButtonView()
    }
}
