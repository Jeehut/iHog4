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
            FPButton(buttonText: "Back")
            FPButton(buttonText: "All")
            FPButton(buttonText: "Next")
        }
    }
}

struct SelectButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SelectButtonView()
    }
}
