//
//  FunctionKeyView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/25/20.
//

import SwiftUI

struct FunctionKeyView: View {
    var body: some View {
        VStack{
            HStack{
                FPButton(buttonText: "FX 1")
                FPButton(buttonText: "FX 2")
                FPButton(buttonText: "FX 3")
            }
            HStack{
                FPButton(buttonText: "FX 4")
                FPButton(buttonText: "FX 5")
                FPButton(buttonText: "FX 6")
            }
            HStack{
                FPButton(buttonText: "FX 7")
                FPButton(buttonText: "FX 8")
                FPButton(buttonText: "FX 9")
            }
            HStack{
                FPButton(buttonText: "FX 10")
                FPButton(buttonText: "FX 11")
                FPButton(buttonText: "FX 12")
            }
        }
    }
}

struct FunctionKeyView_Previews: PreviewProvider {
    static var previews: some View {
        FunctionKeyView()
    }
}
