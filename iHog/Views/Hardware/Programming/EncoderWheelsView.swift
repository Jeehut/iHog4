//
//  EncodeWheelsView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/24/20.
//

import SwiftUI

struct EncoderWheelsView: View {
    var body: some View {
        HStack{
            EncoderWheel(paramName: "Pan", paramValue: "0")
            EncoderWheel(paramName: "Pan", paramValue: "0")
            EncoderWheel(paramName: "Pan", paramValue: "0")
            EncoderWheel(paramName: "Pan", paramValue: "0")
        }
    }
}

struct EncoderWheelsView_Previews: PreviewProvider {
    static var previews: some View {
        EncoderWheelsView()
    }
}
