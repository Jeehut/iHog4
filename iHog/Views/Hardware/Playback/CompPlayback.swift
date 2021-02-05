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
                FPButton(buttonText: "Next Page",
                         buttonFunction: .nextpage)
                Spacer()
                FPButton(buttonText: "Back Page", buttonFunction: .backpage)
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
                    FPButton(buttonText: "CH", buttonFunction: .mainchoose)
                    Spacer()
                    FPButton(buttonText: "A", buttonFunction: .assert)
                    Spacer()
                    FPButton(buttonText: "R", buttonFunction: .release)
                }
                HStack{
                    FPButton(buttonText: "<<", buttonFunction: .skipback)
                    Spacer()
                    FPButton(buttonText: "Pig", buttonFunction: .pig)
                    Spacer()
                    FPButton(buttonText: ">>", buttonFunction: .skipfwd)
                }
                HStack{
                    FPButton(buttonText: "Back", buttonFunction: .mainback)
                    Spacer()
                    FPButton(buttonText: "Pause", buttonFunction: .mainhalt)
                    Spacer()
                    FPButton(buttonText: "Play", buttonFunction: .maingo)
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
