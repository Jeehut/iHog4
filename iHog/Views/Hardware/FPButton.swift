//
//  FPButton.swift
//  iHog
//
//  Created by Maegan Wilson on 9/24/20.
//

import SwiftUI

struct FPButton: View {
    @EnvironmentObject var osc: OSCHelper
    
    var buttonText: String
    var buttonFunction: String = "master"
    var buttonNumber: Int = 0
    var size: Int = 1
    
    var body: some View {
        Button(action: {
            pushButton()
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
        switch buttonFunction {
        case "choose":
            if osc.chooses[buttonNumber] == 0.0 {
                return Color.gray
            }
            return Color.blue
        case "flash":
            if osc.flashes[buttonNumber] == 0.0 {
                return Color.gray
            }
            return Color.red
        case "go":
            if osc.plays[buttonNumber] == 0.0 {
                return Color.gray
            }
            return Color.green
        case "goback":
            if osc.backs[buttonNumber] == 0.0 {
                return Color.gray
            }
            return Color.green
        case "pause":
            if osc.pauses[buttonNumber] == 0.0 {
                return Color.gray
            }
            return Color.red
        default:
            return Color.gray
        }
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
    
    func pushButton(){
        switch buttonFunction {
        case "choose", "goback", "pause", "go", "flash":
            osc.playbackButton(button: buttonFunction, master: buttonNumber)
        case "numberpad":
            let formatter = NumberFormatter()
            formatter.numberStyle = .spellOut
            let english = formatter.string(from: NSNumber(value: buttonNumber))
            print(english ?? "NUMBER DIDN'T CONVERT")
            osc.frontPanelButton(button: english!)
        default:
            osc.frontPanelButton(button: buttonFunction)
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
