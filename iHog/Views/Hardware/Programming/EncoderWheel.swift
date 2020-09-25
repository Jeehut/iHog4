//
//  EncoderWheel.swift
//  iHog
//
//  Created by Maegan Wilson on 9/24/20.
//

import SwiftUI

struct EncoderWheel: View {
    var paramName: String
    var paramValue: String
    var body: some View {
        VStack{
            Text("+")
                .fontWeight(.heavy)
                .frame(width: 50, height: 50, alignment: .center)
                .background(Color.blue)
                .foregroundColor(.primary)
                .cornerRadius(5.0)
            VStack{
                Text(paramName)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                Text(paramValue)
            }
            .frame(width: 90, height: 75, alignment: .center)
            Text("-")
                .fontWeight(.heavy)
                .frame(width: 50, height: 50, alignment: .center)
                .background(Color.blue)
                .foregroundColor(.primary)
                .cornerRadius(5.0)
        }
        .frame(width: 100, height: 175, alignment: .center)
        .padding()
    }
}

struct EncoderWheel_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HStack{
                EncoderWheel(paramName: "Pan", paramValue: "0")
                EncoderWheel(paramName: "Tilt", paramValue: "0")
                EncoderWheel(paramName: "Zoom", paramValue: "0")
                EncoderWheel(paramName: "Focus", paramValue: "0")
                EncoderWheel(paramName: "Gobo 2 <>", paramValue: "0")
            }
            HStack{
                EncoderWheel(paramName: "Pan", paramValue: "0")
                EncoderWheel(paramName: "Tilt", paramValue: "0")
                EncoderWheel(paramName: "Zoom", paramValue: "0")
                EncoderWheel(paramName: "Focus", paramValue: "0")
                EncoderWheel(paramName: "Gobo 2 <>", paramValue: "0")
            }
            .preferredColorScheme(.dark)
        }
    }
}
