//
//  RegCompPlayback.swift
//  iHog
//
//  Created by Maegan Wilson on 11/19/20.
//

import SwiftUI

struct RegCompPlayback: View {
    var body: some View {
        HStack{
            VStack{
                FPButton(buttonText: "Choose")
                    .padding(.bottom)
                FPButton(buttonText: "Assert")
                FPButton(buttonText: "Release")
                    .padding(.bottom)
                FPButton(buttonText: "Pig")
            }
            VStack{
                FPButton(buttonText: "Next Page")
                FPButton(buttonText: "Back Page")
                FPButton(buttonText: ">>")
                    .padding(.vertical)
                FPButton(buttonText: "<<")
            }
            .padding()
            VStack{
                Spacer()
                FPButton(buttonText: "Back")
                FPButton(buttonText: "Pause")
                    .padding(.vertical)
                FPButton(buttonText: "Play")
            }
            ScrollView(.vertical){
                LazyVStack{
                    ForEach(1 ..< 90) { num in
                        HorizontalMasterView(masterNumber: num).padding(.all, BASE_PADDING)
                    }
                }
            }.padding(.horizontal)
        }
    }
}

struct RegCompPlayback_Previews: PreviewProvider {
    static var previews: some View {
        RegCompPlayback()
    }
}
