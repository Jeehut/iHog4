//
//  RegCompFPProgrammer.swift
//  iHog
//
//  Created by Maegan Wilson on 9/25/20.
//

import SwiftUI

struct RegCompFPProgrammer: View {
    var body: some View {
        VStack{
            CommandLineView(commandLineText: "SolaSpot 1000 1 > 10 @ 100%")
            HStack(alignment: .bottom){
                OpenPartsView()
                VStack{
                    SelectButtonView()
                    HBCButtonView()
                    Spacer().frame(width: 80, height: 80, alignment: .center)
                    ActionButtonView()
                }.padding(.horizontal)
                NumericKeypadView()
            }
        }
    }
}

struct RegCompFPProgrammer_Previews: PreviewProvider {
    static var previews: some View {
        RegCompFPProgrammer()
    }
}
