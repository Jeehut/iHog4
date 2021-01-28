//
//  FunctionKeyView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/25/20.
//

import SwiftUI

struct FunctionKeyView: View {
    @EnvironmentObject var osc: OSCHelper
    
    var body: some View {
        VStack{
            HStack{
                FPButton(buttonText: "FX 1", buttonFunction: .h1)
                FPButton(buttonText: "FX 2", buttonFunction: .h2)
                FPButton(buttonText: "FX 3", buttonFunction: .h3)
            }
            HStack{
                FPButton(buttonText: "FX 4", buttonFunction: .h4)
                FPButton(buttonText: "FX 5", buttonFunction: .h5)
                FPButton(buttonText: "FX 6", buttonFunction: .h6)
            }
            HStack{
                FPButton(buttonText: "FX 7", buttonFunction: .h7)
                FPButton(buttonText: "FX 8", buttonFunction: .h8)
                FPButton(buttonText: "FX 9", buttonFunction: .h9)
            }
            HStack{
                FPButton(buttonText: "FX 10", buttonFunction: .h10)
                FPButton(buttonText: "FX 11", buttonFunction: .h11)
                FPButton(buttonText: "FX 12", buttonFunction: .h12)
            }
        }
    }
}

struct FunctionKeyView_Previews: PreviewProvider {
    static var previews: some View {
        FunctionKeyView()
    }
}
