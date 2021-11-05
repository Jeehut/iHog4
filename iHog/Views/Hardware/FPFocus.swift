//
//  FPFocus.swift
//  iHog
//
//  Created by Maegan Wilson on 11/5/21.
//

import SwiftUI

struct FPFocus: View {
    @EnvironmentObject var osc: OSCHelper
    var body: some View {
        VStack{
            NumericKeypadView()
            SelectButtonView()
        }
    }
}

struct FPFocus_Previews: PreviewProvider {
    static var previews: some View {
        FPFocus()
    }
}
