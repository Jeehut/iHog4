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
                EncoderWheel(encoderWheelNum: 1, paramName: osc.encoderWheelLabels[0], paramValue: osc.encoderWheelValues[0])
                EncoderWheel(encoderWheelNum: 2, paramName: osc.encoderWheelLabels[1], paramValue: osc.encoderWheelValues[1])
                EncoderWheel(encoderWheelNum: 3, paramName: osc.encoderWheelLabels[2], paramValue: osc.encoderWheelValues[2])
                EncoderWheel(encoderWheelNum: 4, paramName: osc.encoderWheelLabels[3], paramValue: osc.encoderWheelValues[3])
                if isNanoModeOn == false {
                    EncoderWheel(encoderWheelNum: 5, paramName: osc.encoderWheelLabels[4], paramValue: osc.encoderWheelValues[4])
                }
            }.padding()
        } else {
            VStack(alignment: .leading){
                HStack{
                    EncoderWheel(encoderWheelNum: 1, paramName: osc.encoderWheelLabels[0], paramValue: osc.encoderWheelValues[0])
                    EncoderWheel(encoderWheelNum: 2, paramName: osc.encoderWheelLabels[1], paramValue: osc.encoderWheelValues[1])
                    EncoderWheel(encoderWheelNum: 3, paramName: osc.encoderWheelLabels[2], paramValue: osc.encoderWheelValues[2])
                }.frame(maxHeight: 150)
                HStack{
                    EncoderWheel(encoderWheelNum: 4, paramName: osc.encoderWheelLabels[3], paramValue: osc.encoderWheelValues[3])
                    if isNanoModeOn == false {
                        EncoderWheel(encoderWheelNum: 5, paramName: osc.encoderWheelLabels[4], paramValue: osc.encoderWheelValues[4])
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
