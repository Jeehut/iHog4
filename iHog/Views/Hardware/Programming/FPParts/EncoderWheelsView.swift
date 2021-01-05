//
//  EncodeWheelsView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/24/20.
//

import SwiftUI

struct EncoderWheelsView: View {
    @EnvironmentObject var osc: OSCHelper
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @AppStorage(Settings.isNanoModeOn.rawValue) var isNanoModeOn: Bool = false
    var body: some View {
        if horizontalSizeClass == .regular {
            // ipad or room for 5 encoders
            HStack{
                EncoderWheel(encoderWheelNum: 1, paramName: "Pan", paramValue: "-100")
                EncoderWheel(encoderWheelNum: 2, paramName: "Tilt", paramValue: "95")
                EncoderWheel(encoderWheelNum: 3, paramName: "Zoom", paramValue: "100")
                EncoderWheel(encoderWheelNum: 4, paramName: "Focus", paramValue: "100")
                if isNanoModeOn == false {
                    EncoderWheel(encoderWheelNum: 5, paramName: "Iris", paramValue: "50")
                }
            }.padding()
        } else {
            VStack(alignment: .leading){
                HStack{
                    EncoderWheel(encoderWheelNum: 1, paramName: "Pan", paramValue: "-100")
                    EncoderWheel(encoderWheelNum: 2, paramName: "Tilt", paramValue: "95")
                    EncoderWheel(encoderWheelNum: 3, paramName: "Zoom", paramValue: "100")
                }.frame(maxHeight: 150)
                HStack{
                    EncoderWheel(encoderWheelNum: 4, paramName: "Focus", paramValue: "100")
                    if isNanoModeOn == false {
                        EncoderWheel(encoderWheelNum: 5, paramName: "Iris", paramValue: "50")
                    }
                }.frame(maxHeight: 140)
            }
        }
    }
}

struct EncoderWheelsView_Previews: PreviewProvider {
    static var previews: some View {
        EncoderWheelsView()
    }
}
