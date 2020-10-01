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
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 5.0)
                .fill(Color.gray)
                .frame(width: 250, height: 25, alignment: .center)
            RoundedRectangle(cornerRadius: 5.0)
                .frame(width: 30, height: 30, alignment: .center)
                .offset(x: CGFloat(faderLevel))
                .gesture(DragGesture().onChanged({value in
                    setFaderLevel(newValue: value.location.x)
                }))
//            Text("\(faderLevel)").foregroundColor(.red)
        }
    }
    
    func setFaderLevel(newValue: CGFloat) {
        // 110 is max
        //-110 is min
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

struct HorizontalSlider_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalSlider()
    }
}
