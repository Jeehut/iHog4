//
//  CompRegFPprogrammingView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/28/20.
//

import SwiftUI

struct CompRegFPprogramming: View {
    var body: some View {
        VStack{
            CommandLineView(commandLineText: "SolaSpot Pro 2000 1 > 101 @ 50%").padding(.vertical)
            NumericKeypadView()
            HBCButtonView()
                .padding(.vertical)
            SelectButtonView()
                .padding(.bottom)
            ScrollView{
                OpenPartsView()
            }
        }
    }
}

struct CompRegFPprogrammingView_Previews: PreviewProvider {
    static var previews: some View {
        CompRegFPprogramming()
    }
}
