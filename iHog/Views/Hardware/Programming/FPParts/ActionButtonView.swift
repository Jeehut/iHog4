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
                FPButton(buttonText: "Delete", buttonFunction: "delete")
                FPButton(buttonText: "Move", buttonFunction: "move")
                FPButton(buttonText: "Copy", buttonFunction: "copy")
            }
            HStack{
                FPButton(buttonText: "Update", buttonFunction: "update")
                FPButton(buttonText: "Merge", buttonFunction: "merge")
                FPButton(buttonText: "Record", buttonFunction: "record")
            }
        }
    }
}

struct ActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonView()
    }
}
