//
//  VerticalSlider.swift
//  iHog
//
//  Created by Maegan Wilson on 9/30/20.
//

import SwiftUI

// +y value for offset = up
// -y value for offset = down
struct VerticalSlider: View {
    @State private var faderLevel: Double = 110
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: BASE_CORNER_RADIUS)
                .fill(Color.gray)
                .frame(width: BASE_SLIDER_WIDTH,
                    height: BASE_SLIDER_HEIGHT,
                    alignment: .center
                )
            RoundedRectangle(cornerRadius: BASE_CORNER_RADIUS)
                .frame(width: BASE_THUMB_SIZE,
                       height: BASE_THUMB_SIZE,
                       alignment: .center)
                .offset(y: CGFloat(faderLevel))
                .gesture(DragGesture()
                            .onChanged({value in
                                setFaderLevel(newValue: value.location.y)
                            }))
//            Text("\(faderLevel)").foregroundColor(.red)
        }
    }
    
    func setFaderLevel(newValue: CGFloat) {
        // 110 is min
        //-110 is max
        if newValue >= 110 {
            faderLevel = 110.0
            // send OSC for max which is 255
        } else if newValue <= -110 {
            faderLevel = -110.0
            // send OSC for min which is 0
        } else {
            faderLevel = Double(newValue)
            // TODO: Figure out math for sending OSC
        }
    }
}

struct VerticalSlider_Previews: PreviewProvider {
    static var previews: some View {
        VerticalSlider()
    }
}
