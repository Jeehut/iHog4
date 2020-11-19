//
//  EncodeWheelsView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/24/20.
//

import SwiftUI

struct EncoderWheelsView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @AppStorage(Settings.isNanoModeOn.rawValue) var isNanoModeOn: Bool = false
    var body: some View {
        if horizontalSizeClass == .regular {
            // ipad or room for 5 encoders
            HStack{
                EncoderWheel(paramName: "Pan", paramValue: "-100")
                EncoderWheel(paramName: "Tilt", paramValue: "95")
                EncoderWheel(paramName: "Zoom", paramValue: "100")
                EncoderWheel(paramName: "Focus", paramValue: "100")
                if isNanoModeOn == false {
                    EncoderWheel(paramName: "Iris", paramValue: "50")
                }
            }.padding()
        } else {
            VStack(alignment: .leading){
                HStack{
                    EncoderWheel(paramName: "Pan", paramValue: "-100")
                    EncoderWheel(paramName: "Tilt", paramValue: "95")
                    EncoderWheel(paramName: "Zoom", paramValue: "100")
                }.frame(maxHeight: 150)
                HStack{
                    EncoderWheel(paramName: "Focus", paramValue: "100")
                    if isNanoModeOn == false {
                        EncoderWheel(paramName: "Iris", paramValue: "50")
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
