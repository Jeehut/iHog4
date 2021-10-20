//
//  RegRegFPProgramming.swift
//  iHog
//
//  Created by Maegan Wilson on 9/23/20.
//

import SwiftUI

struct RegRegFPProgramming: View {
    @EnvironmentObject var osc: OSCHelper
    
    let minSpace = CGFloat(10)
    var body: some View {
        VStack{
            EncoderWheelsView()
                .environmentObject(osc)
            HStack(alignment: .bottom){
                VStack{
                    ObjectButtonView()
                    Spacer(minLength: minSpace*2)
                    ActionButtonView()
                    Spacer(minLength: minSpace*2)
                    UtilityButtonView()
                }.frame(maxHeight: .infinity)
                Spacer(minLength: minSpace)
                VStack{
                    KindButtonView()
                    Spacer(minLength: minSpace*2)
                    NumericKeypadView()
                }
                Spacer(minLength: minSpace)
                VStack{
                    HBCButtonView()
                    Spacer(minLength: minSpace*2)
                    SelectButtonView()
                    Spacer(minLength: minSpace*2)
                    FunctionKeyView()
                }
            }.padding()
            .fixedSize(horizontal: false, vertical: true)
        }
    }
}

struct FPProgramming_Previews: PreviewProvider {
    static var previews: some View {
        RegRegFPProgramming()
        
    }
}
