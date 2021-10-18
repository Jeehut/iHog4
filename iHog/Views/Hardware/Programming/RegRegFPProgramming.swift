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
            EncoderWheelsView()
                .environmentObject(osc)
                .padding()
            Spacer()
            HStack(alignment: .bottom){
                VStack{
                    ObjectButtonView()
                        .padding(.bottom, BASE_PADDING)
                    Spacer()
                        .frame(width: 65, height: 65)
                        .padding(.bottom, BASE_PADDING)
                    ActionButtonView()
                    Spacer()
                        .frame(width: 65, height: 65)
                        .padding(.bottom, BASE_PADDING)
                    UtilityButtonView()
                }
                VStack{
                    KindButtonView()
                    Spacer()
                        .frame(width: 65, height: 65)
                        .padding(.bottom, BASE_PADDING)
                    NumericKeypadView()
                }.padding(.horizontal, BASE_PADDING*4)
                VStack(alignment: .leading){
                    HBCButtonView()
                        .padding(.bottom, BASE_PADDING*2)
                    SelectButtonView()
                    Spacer()
                        .frame(width: 65, height: 65)
                        .padding(.bottom, BASE_PADDING)
                    FunctionKeyView()
                }
            }
            .padding(.bottom)
        }
        .padding(.horizontal, BASE_PADDING*2)
    }
}

struct FPProgramming_Previews: PreviewProvider {
    static var previews: some View {
        RegRegFPProgramming()
        
    }
}
