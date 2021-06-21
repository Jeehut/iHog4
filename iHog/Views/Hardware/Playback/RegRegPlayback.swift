//
//  RegRegPlayback.swift
//  iHog
//
//  Created by Maegan Wilson on 9/30/20.
//

import SwiftUI

struct RegRegPlayback: View {
    @EnvironmentObject var osc: OSCHelper
    var body: some View {
        HStack{
            VStack{
                HStack{
                    FPButton(buttonText: "Back Page", buttonFunction: .backpage)
                    Spacer()
                    FPButton(buttonText: "Next Page", buttonFunction: .nextpage)
                }.frame(width: 400)
                Spacer()
                ScrollView(.horizontal){
                    LazyHStack{
                        ForEach(1 ..< 90) { num in
                            VerticalMasterView(masterNumber: num).padding(.all, BASE_PADDING)
                        }
                    }
                }.padding(.horizontal)
            }
            VStack{
                FPButton(buttonText: "CH", buttonFunction: .mainchoose)
                    .padding(.bottom)
                FPButton(buttonText: "A", buttonFunction: .assert)
                    .padding(.bottom)
                FPButton(buttonText: "R", buttonFunction: .release)
                    .padding(.bottom)
                    .contextMenu{
                        Button(action: {
                            print("Release All")
                            osc.sendReleaseAllMessage()
                        }, label: {
                            Text("Release All")
                        })
                    }
                FPButton(buttonText: ">>", buttonFunction: .skipfwd)
                    .padding(.bottom)
                FPButton(buttonText: "<<", buttonFunction: .skipback)
                    .padding(.bottom)
                FPButton(buttonText: "Back", buttonFunction: .mainback)
                    .padding(.bottom)
                FPButton(buttonText: "Pause", buttonFunction: .mainhalt)
                    .padding(.bottom)
                FPButton(buttonText: "Play", buttonFunction: .maingo)
                    .padding(.bottom)
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
