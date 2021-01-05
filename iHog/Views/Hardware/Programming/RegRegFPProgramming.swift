//
//  RegRegFPProgramming.swift
//  iHog
//
//  Created by Maegan Wilson on 9/23/20.
//

import SwiftUI

struct RegRegFPProgramming: View {
    @EnvironmentObject var osc: OSCHelper
    var body: some View {
        VStack{
//            CommandLineView(commandLineText: "SolaSpot 1000 1 > 10 @ 100%")
            EncoderWheelsView()
                .environmentObject(osc)
                .padding()
            HStack(alignment: .bottom){
                VStack{
                    ObjectButtonView()
                    Spacer()
                        .frame(minWidth: 100, idealWidth: 100, maxWidth: 100, minHeight: 0, idealHeight: 72, maxHeight: 72, alignment: .center)
                    ActionButtonView()
                    Spacer()
                        .frame(minWidth: 100, idealWidth: 100, maxWidth: 100, minHeight: 0, idealHeight: 80, maxHeight: 80, alignment: .center)
                    UtilityButtonView()
                }
                VStack{
                    KindButtonView()
                    Spacer()
                        .frame(minWidth: 100, idealWidth: 100, maxWidth: 100, minHeight: 0, idealHeight: 72, maxHeight: 72, alignment: .center)
                    NumericKeypadView()
                }
                    .padding(.horizontal)
                VStack(alignment: .leading){
                    HBCButtonView()
                    Spacer()
                        .frame(minWidth: 100, idealWidth: 100, maxWidth: 100, minHeight: 0, idealHeight: 80, maxHeight: 80, alignment: .center)
                    SelectButtonView()
                    Spacer()
                        .frame(minWidth: 100, idealWidth: 100, maxWidth: 100, minHeight: 0, idealHeight: 72, maxHeight: 72, alignment: .center)
                    FunctionKeyView()
                }
            }
        }
    }
}

struct FPProgramming_Previews: PreviewProvider {
    static var previews: some View {
        RegRegFPProgramming()
            
    }
}
