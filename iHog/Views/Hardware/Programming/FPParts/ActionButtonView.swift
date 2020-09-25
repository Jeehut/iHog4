//
//  ActionButtonView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/24/20.
//

import SwiftUI

struct ActionButtonView: View {
    var body: some View {
        VStack{
            HStack{
                FPButton(buttonText: "Delete")
                FPButton(buttonText: "Move")
                FPButton(buttonText: "Copy")
            }
            HStack{
                FPButton(buttonText: "Update")
                FPButton(buttonText: "Merge")
                FPButton(buttonText: "Record")
            }
        }
    }
}

struct ActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonView()
    }
}
