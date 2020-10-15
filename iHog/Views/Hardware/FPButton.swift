//
//  FPButton.swift
//  iHog
//
//  Created by Maegan Wilson on 9/24/20.
//

import SwiftUI

struct FPButton: View {
    var buttonText: String
    var size: Int = 1
    
    var body: some View {
        Button(action: {
            print("Do Something")
        }){
            Text(buttonText)
        }
        .frame(width: setSize(),
               height: BASE_BUTTON_SIZE,
               alignment: .center
        )
        .padding(HALF_PADDING)
        .foregroundColor(.primary)
        .background(setBackGroundColor())
        .cornerRadius(BASE_CORNER_RADIUS)
    }
    
    func setBackGroundColor() -> Color {
        if buttonText.lowercased() == "pig" {
            return Color.pink
        }
        return Color.gray
    }
    
    func setSize() -> CGFloat {
        switch size {
        case 0:
            return SMALL_BUTTON_SIZE
        case 1:
            return BASE_BUTTON_SIZE
        case 3:
            return L_BUTTON_WIDTH
        default:
            return BASE_BUTTON_SIZE
        }
    }
}

struct FPButton_Previews: PreviewProvider {
    static var previews: some View {
        FPButton(
            buttonText: "Record"
        )
    }
}
