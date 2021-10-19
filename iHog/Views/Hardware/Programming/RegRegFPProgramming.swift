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
        VStack(spacing: 10){
            EncoderWheelsView()
                .environmentObject(osc)
            HStack(alignment: .bottom, spacing: 10){
                VStack(spacing: 20){
                    ObjectButtonView()
                    ActionButtonView()
                    UtilityButtonView()
                }
                VStack(spacing: 10){
                    KindButtonView()
                    NumericKeypadView()
                }
                VStack(alignment: .leading, spacing: 10){
                    HBCButtonView()
                    SelectButtonView()
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
