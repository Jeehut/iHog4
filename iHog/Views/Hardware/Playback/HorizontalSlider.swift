//
//  HorizontalSlider.swift
//  iHog
//
//  Created by Maegan Wilson on 10/1/20.
//

import SwiftUI

// +x = right
// -x = left
struct HorizontalSlider: View {
    @State private var faderLevel: Double = -110
    @State private var consoleFaderValue: Double = 0.0
    @State private var absoluteFaderLevel: Double = 0.0
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: BASE_CORNER_RADIUS)
                .fill(Color.gray)
                .frame(width: BASE_SLIDER_HEIGHT,
                    height: BASE_SLIDER_WIDTH,
                    alignment: .center
                )
            RoundedRectangle(cornerRadius: BASE_CORNER_RADIUS)
                .frame(width: BASE_THUMB_SIZE,
                       height: BASE_THUMB_SIZE,
                       alignment: .center
                )
                .offset(x: CGFloat(faderLevel))
                .gesture(
                    DragGesture().onChanged({value in
//                        print("New value: \(value.location.x)")
                        setFaderLevel(newValue: value.location.x)
                    }))
//            Text("\(consoleFaderValue)").foregroundColor(.red)
        }
    }
    
    func setFaderLevel(newValue: CGFloat) {
        // TODO: Add OSC
        // 110 is max
        //-110 is min
        if newValue <= -110 {
            absoluteFaderLevel = 0
            faderLevel = -110
            consoleFaderValue = 0
        } else if newValue >= 110 {
            absoluteFaderLevel = 220
            faderLevel = 110
            consoleFaderValue = 255
        } else if Double(newValue) > faderLevel {
            // Fader moves up
            absoluteFaderLevel = absoluteFaderLevel - (faderLevel-Double(newValue))
            faderLevel = Double(newValue)
            consoleFaderValue = absoluteFaderLevel * 1.159
        } else if Double(newValue) < faderLevel {
            // Fader moves down
            absoluteFaderLevel = absoluteFaderLevel - abs(faderLevel-Double(newValue))
            faderLevel = Double(newValue)
            consoleFaderValue = absoluteFaderLevel * 1.159
        }
    }
}

struct HorizontalSlider_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalSlider()
    }
}
