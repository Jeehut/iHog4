//
//  EncoderWheel.swift
//  iHog
//
//  Created by Maegan Wilson on 9/24/20.
//

import SwiftUI

struct EncoderWheel: View {
    @EnvironmentObject var osc: OSCHelper
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @AppStorage(Settings.encoderWheelPrecision.rawValue) var encoderWheelPrecision: Double = 2.00
    @State private var yOffSet: CGFloat = 0
    
    var widthHeight: CGFloat {
        if horizontalSizeClass == .compact {
            return CGFloat(100.0)
        } else {
            return CGFloat(150.0)
        }
    }
    
    var encoderWheelNum: Int
    var paramName: String
    var paramValue: String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.gray)
                .aspectRatio(1.0, contentMode: .fit)
            VStack{
                Text(paramName)
                    .font(.headline)
                Text("\(paramValue)")
                    .font(.subheadline)
            }.foregroundColor(.primary)
            // MARK: Small Grab thing
            RoundedRectangle(cornerRadius: 5.0)
                .fill(Color.init(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.25))
                .frame(width: 30, height: 20, alignment: .center)
                .offset(y: yOffSet)
                .gesture(DragGesture()
                            .onEnded({value in
                                print("Ended")
                                yOffSet = 0
                            })
                            .onChanged({value in
                    sendEncoder(newValue: value.location.y)
                }))
        }.onTapGesture {
            print("DO SOMETHING")
        }.padding()
        .frame(width: widthHeight, height: widthHeight, alignment: .center)
    }
    
    func sendEncoder(newValue: CGFloat){
        if newValue < yOffSet {
            osc.encoderWheel(encoderNum: encoderWheelNum, value: encoderWheelPrecision)
            yOffSet = newValue
        } else {
            osc.encoderWheel(encoderNum: encoderWheelNum, value: -(encoderWheelPrecision))
            yOffSet = newValue
        }
    }
}

struct EncoderWheel_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HStack{
                EncoderWheel(encoderWheelNum: 1, paramName: "Pan", paramValue: "0")
                EncoderWheel(encoderWheelNum: 1, paramName: "Tilt", paramValue: "0")
                EncoderWheel(encoderWheelNum: 1, paramName: "Zoom", paramValue: "0")
                EncoderWheel(encoderWheelNum: 1, paramName: "Focus", paramValue: "0")
                EncoderWheel(encoderWheelNum: 1, paramName: "Gobo 2", paramValue: "Slots")
            }
            HStack{
                EncoderWheel(encoderWheelNum: 1, paramName: "Pan", paramValue: "0")
                EncoderWheel(encoderWheelNum: 1, paramName: "Tilt", paramValue: "0")
                EncoderWheel(encoderWheelNum: 1, paramName: "Zoom", paramValue: "0")
                EncoderWheel(encoderWheelNum: 1, paramName: "Focus", paramValue: "0")
                EncoderWheel(encoderWheelNum: 1, paramName: "Gobo 2 <>", paramValue: "0")
            }
            .preferredColorScheme(.dark)
        }
    }
}
