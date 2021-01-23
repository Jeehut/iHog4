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
                FPButton(buttonText: "Delete", buttonFunction: ButtonFunctionNames.delete.rawValue)
                FPButton(buttonText: "Move", buttonFunction: ButtonFunctionNames.move.rawValue)
                FPButton(buttonText: "Copy", buttonFunction: ButtonFunctionNames.copy.rawValue)
            }
            HStack{
                FPButton(buttonText: "Update", buttonFunction: ButtonFunctionNames.update.rawValue)
                FPButton(buttonText: "Merge", buttonFunction: ButtonFunctionNames.merge.rawValue)
                FPButton(buttonText: "Record", buttonFunction: ButtonFunctionNames.record.rawValue)
            }
        }
    }
}

struct ActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonView()
    }
}
