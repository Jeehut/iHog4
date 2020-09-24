//
//  FPProgramming.swift
//  iHog
//
//  Created by Maegan Wilson on 9/23/20.
//

import SwiftUI

struct FPProgramming: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        VStack{
            Text("Command Line \(horizontalSizeClass.debugDescription)")
            EncoderWheelsView()
            HStack{
                VStack{
                    ObjectButtonView()
                    Spacer()
                        .frame(width: 50, height: 64, alignment: .center)
                    ActionButtonView()
                    Spacer()
                        .frame(width: 100, height: 72, alignment: .center)
                    UtilityButtonView()
                }.padding(.trailing)
                VStack{
                    KindButtonView()
                    Spacer()
                        .frame(width: 100, height: 60, alignment: .center)
                    NumericKeypadView()
                }
            }
        }
    }
}

struct FPProgramming_Previews: PreviewProvider {
    static var previews: some View {
        FPProgramming()
    }
}
