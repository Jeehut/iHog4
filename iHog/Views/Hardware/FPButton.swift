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
    var buttonFunction: ButtonFunctionNames = .master
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
        case ButtonFunctionNames.choose:
            if osc.chooses[buttonNumber] == 0.0 {
                return Color.gray
            }
            return Color.blue
        case ButtonFunctionNames.flash:
            if osc.flashes[buttonNumber] == 0.0 {
                return Color.gray
            }
            return Color.red
        case ButtonFunctionNames.go:
            if osc.plays[buttonNumber] == 0.0 {
                return Color.gray
            }
            return Color.green
        case ButtonFunctionNames.goback:
            if osc.backs[buttonNumber] == 0.0 {
                return Color.gray
            }
            return Color.green
        case ButtonFunctionNames.pause:
            if osc.pauses[buttonNumber] == 0.0 {
                return Color.gray
            }
            return Color.red
        case ButtonFunctionNames.highlight:
            if osc.highlight == 0.0 {
                return Color.gray
            }
            return Color.blue
        case ButtonFunctionNames.clear:
            if osc.clear == 0.0 {
                return Color.gray
            }
            return Color.red
        case ButtonFunctionNames.blind:
            return color(for: osc.blind)
        case ButtonFunctionNames.intensity, ButtonFunctionNames.position, ButtonFunctionNames.colour, ButtonFunctionNames.beam, ButtonFunctionNames.effect,
            ButtonFunctionNames.time:
            return color(for: osc.kindKeys[buttonFunction.rawValue] ?? 0.0)
        default:
            return Color.gray
        }
    }
    
    func color(for button: Float) -> Color {
        button == 0.0 ? .gray : .blue
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
        case ButtonFunctionNames.choose,
             ButtonFunctionNames.goback,
             ButtonFunctionNames.pause,
             ButtonFunctionNames.go,
             ButtonFunctionNames.flash:
            osc.playbackButton(button: buttonFunction.rawValue, master: buttonNumber)
        case ButtonFunctionNames.numberpad:
            let formatter = NumberFormatter()
            formatter.numberStyle = .spellOut
            let english = formatter.string(from: NSNumber(value: buttonNumber))
            osc.frontPanelButton(button: english!)
        default:
            osc.frontPanelButton(button: buttonFunction.rawValue)
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
