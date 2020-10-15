//
//  CompPlayback.swift
//  iHog
//
//  Created by Maegan Wilson on 10/1/20.
//

import SwiftUI

struct CompPlayback: View {
    var body: some View {
        VStack{
            HStack{
                FPButton(buttonText: "Next Page")
                Spacer()
                FPButton(buttonText: "Back Page")
            }
            .padding(.horizontal)
            .padding(.bottom)
            ScrollView(.vertical){
                LazyVStack{
                    ForEach(1 ..< 90) { num in
                        HorizontalMasterView(masterNumber: num).padding(.all, BASE_PADDING)
                    }
                }
            }
            VStack{
                HStack{
                    FPButton(buttonText: "CH")
                    Spacer()
                    FPButton(buttonText: "A")
                    Spacer()
                    FPButton(buttonText: "R")
                }
                HStack{
                    FPButton(buttonText: "<<")
                    Spacer()
                    FPButton(buttonText: "Pig")
                    Spacer()
                    FPButton(buttonText: ">>")
                }
                HStack{
                    FPButton(buttonText: "Back")
                    Spacer()
                    FPButton(buttonText: "Pause")
                    Spacer()
                    FPButton(buttonText: "Play")
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}

struct CompPlayback_Previews: PreviewProvider {
    static var previews: some View {
        CompPlayback()
    }
}
