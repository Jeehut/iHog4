//
//  NumericKeypadView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/24/20.
//

import SwiftUI

struct NumericKeypadView: View {
    var body: some View {
        VStack{
            HStack{
                FPButton(buttonText: "<-")
                FPButton(buttonText: "/")
                FPButton(buttonText: "-")
                FPButton(buttonText: "+")
            }
            HStack{
                FPButton(buttonText: "7")
                FPButton(buttonText: "8")
                FPButton(buttonText: "9")
                FPButton(buttonText: "Thru")
            }
            HStack{
                FPButton(buttonText: "4")
                FPButton(buttonText: "5")
                FPButton(buttonText: "6")
                FPButton(buttonText: "Full")
            }
            HStack{
                FPButton(buttonText: "1")
                FPButton(buttonText: "2")
                FPButton(buttonText: "3")
                FPButton(buttonText: "@")
            }
            HStack{
                FPButton(buttonText: "0")
                FPButton(buttonText: ".")
                FPButton(buttonText: "Enter")
                FPButton(buttonText: "Enter")
            }
        }
    }
}

struct NumericKeypadView_Previews: PreviewProvider {
    static var previews: some View {
        NumericKeypadView()
    }
}
