//
//  EncodeWheelsView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/24/20.
//

import SwiftUI

struct EncoderWheelsView: View {
    var isNanoOn: Bool = false
    var body: some View {
        HStack{
            EncoderWheel(paramName: "Pan", paramValue: "-100")
            EncoderWheel(paramName: "Tilt", paramValue: "95")
            EncoderWheel(paramName: "Zoom", paramValue: "100")
            EncoderWheel(paramName: "Focus", paramValue: "100")
            EncoderWheel(paramName: "Iris", paramValue: "50")
        }.padding()
    }
}

struct EncoderWheelsView_Previews: PreviewProvider {
    static var previews: some View {
        EncoderWheelsView()
    }
}
