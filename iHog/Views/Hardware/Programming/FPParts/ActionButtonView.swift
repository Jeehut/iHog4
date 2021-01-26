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
                FPButton(buttonText: "Delete", buttonFunction: ButtonFunctionNames.delete)
                FPButton(buttonText: "Move", buttonFunction: ButtonFunctionNames.move)
                FPButton(buttonText: "Copy", buttonFunction: ButtonFunctionNames.copy)
            }
            HStack{
                FPButton(buttonText: "Update", buttonFunction: ButtonFunctionNames.update)
                FPButton(buttonText: "Merge", buttonFunction: ButtonFunctionNames.merge)
                FPButton(buttonText: "Record", buttonFunction: ButtonFunctionNames.record)
            }
        }
    }
}

struct ActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonView()
    }
}
