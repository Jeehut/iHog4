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
                FPButton(buttonText: "<-", buttonFunction: .backspace)
                FPButton(buttonText: "/", buttonFunction: .slash)
                FPButton(buttonText: "-", buttonFunction: .minus)
                FPButton(buttonText: "+", buttonFunction: .plus)
            }
            HStack{
                FPButton(buttonText: "7", buttonFunction: .numberpad, buttonNumber: 7)
                FPButton(buttonText: "8", buttonFunction: .numberpad, buttonNumber: 8)
                FPButton(buttonText: "9", buttonFunction: .numberpad, buttonNumber: 9)
                FPButton(buttonText: "Thru", buttonFunction: .thru)
            }
            HStack{
                FPButton(buttonText: "4", buttonFunction: .numberpad, buttonNumber: 4)
                FPButton(buttonText: "5", buttonFunction: .numberpad, buttonNumber: 5)
                FPButton(buttonText: "6", buttonFunction: .numberpad, buttonNumber: 6)
                FPButton(buttonText: "Full", buttonFunction: .full)
            }
            HStack{
                FPButton(buttonText: "1", buttonFunction: .numberpad, buttonNumber: 1)
                FPButton(buttonText: "2", buttonFunction: .numberpad, buttonNumber: 2)
                FPButton(buttonText: "3", buttonFunction: .numberpad, buttonNumber: 3)
                FPButton(buttonText: "@", buttonFunction: .at)
            }
            HStack{
                FPButton(buttonText: "0", buttonFunction: .numberpad, buttonNumber: 0)
                FPButton(buttonText: ".", buttonFunction: .period)
                         FPButton(buttonText: "Enter", buttonFunction: .enter, size: 3)
            }
        }
    }
}

struct NumericKeypadView_Previews: PreviewProvider {
    static var previews: some View {
        NumericKeypadView()
    }
}
