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
                FPButton(buttonText: "7", buttonFunction: "numberpad", buttonNumber: 7)
                FPButton(buttonText: "8", buttonFunction: "numberpad", buttonNumber: 8)
                FPButton(buttonText: "9", buttonFunction: "numberpad", buttonNumber: 9)
                FPButton(buttonText: "Thru")
            }
            HStack{
                FPButton(buttonText: "4", buttonFunction: "numberpad", buttonNumber: 4)
                FPButton(buttonText: "5", buttonFunction: "numberpad", buttonNumber: 5)
                FPButton(buttonText: "6", buttonFunction: "numberpad", buttonNumber: 6)
                FPButton(buttonText: "Full")
            }
            HStack{
                FPButton(buttonText: "1", buttonFunction: "numberpad", buttonNumber: 1)
                FPButton(buttonText: "2", buttonFunction: "numberpad", buttonNumber: 2)
                FPButton(buttonText: "3", buttonFunction: "numberpad", buttonNumber: 3)
                FPButton(buttonText: "@")
            }
            HStack{
                FPButton(buttonText: "0", buttonFunction: "numberpad", buttonNumber: 0)
                FPButton(buttonText: ".")
                FPButton(buttonText: "Enter", size: 3)
            }
        }
    }
}

struct NumericKeypadView_Previews: PreviewProvider {
    static var previews: some View {
        NumericKeypadView()
    }
}
