//
//  OSCLogView.swift
//  iHog
//
//  Created by Maegan Wilson on 2/23/21.
//

import SwiftUI

struct OSCLogView: View {
    @EnvironmentObject var osc: OSCHelper
    
    var body: some View {
        List{
            ForEach(osc.oscLog.reversed(), id: \.self) { message in
                HStack{
                    Image(systemName: "arrow.down.square")
                        .padding(.horizontal)
                    Text(message["message"] ?? "NO MESSAGE")
                    Spacer()
                    Text(message["argument"] ?? "NO MESSAGE")
                }
            }
        }
    }
}

struct OSCLogView_Previews: PreviewProvider {
    static var previews: some View {
        OSCLogView()
    }
}
