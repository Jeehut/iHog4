//
//  RegRegPlayback.swift
//  iHog
//
//  Created by Maegan Wilson on 9/30/20.
//

import SwiftUI

struct RegRegPlayback: View {
    var body: some View {
        HStack{
                ScrollView(.horizontal){
                    LazyHStack{
                        ForEach(1 ..< 90) { num in
                            VerticalMasterView(masterNumber: num).padding(.all, BASE_PADDING)
                        }
                    }
                }.padding(.horizontal)
            VStack{
                FPButton(buttonText: "Choose")
                    .padding(.bottom)
                FPButton(buttonText: "Assert")
                FPButton(buttonText: "Release")
                    .padding(.bottom)
                FPButton(buttonText: "Pig")
                    .padding(.bottom)
                FPButton(buttonText: ">>")
                FPButton(buttonText: "<<")
                    .padding(.bottom)
                FPButton(buttonText: "Back")
                FPButton(buttonText: "Pause")
                FPButton(buttonText: "Play")
            }
            .padding()
            .background(Color.primary)
            .cornerRadius(BASE_CORNER_RADIUS)
        }
    }
}

struct RegRegPlayback_Previews: PreviewProvider {
    static var previews: some View {
        RegRegPlayback()
    }
}
