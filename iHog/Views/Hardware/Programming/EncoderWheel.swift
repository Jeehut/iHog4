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
                .frame(width: 50, height: 50, alignment: .center)
                .background(Color.gray)
                .foregroundColor(.white)
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
                .frame(width: 50, height: 50, alignment: .center)
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(5.0)
        }
        .frame(width: 100, height: 175, alignment: .center)
        .padding()
    }
}

struct EncoderWheel_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            EncoderWheel(paramName: "Pan", paramValue: "0")
            EncoderWheel(paramName: "Pan", paramValue: "0")
            EncoderWheel(paramName: "Pan", paramValue: "0")
            EncoderWheel(paramName: "Pan", paramValue: "0")
            EncoderWheel(paramName: "Gobo 2 <>", paramValue: "0")
        }
    }
}
