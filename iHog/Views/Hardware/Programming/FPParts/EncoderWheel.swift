//
//  EncoderWheel.swift
//  iHog
//
//  Created by Maegan Wilson on 9/24/20.
//

import SwiftUI

struct EncoderWheel: View {
    @State private var yOffSet: CGFloat = 0
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
                Text("\(yOffSet)")
                    .font(.subheadline)
            }.foregroundColor(.primary)
            // Small Grab thing
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
    }
    
    func sendEncoder(newValue: CGFloat){
        yOffSet = newValue
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
                EncoderWheel(paramName: "Gobo 2", paramValue: "Slots")
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
