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
            NumericKeypadView()
            ScrollView{
                HBCButtonView()
                SelectButtonView()
                    .padding(.vertical)
                OpenPartsView()
            }.padding(.bottom)
        }
    }
}

struct CompRegFPprogrammingView_Previews: PreviewProvider {
    static var previews: some View {
        CompRegFPprogramming()
    }
}
