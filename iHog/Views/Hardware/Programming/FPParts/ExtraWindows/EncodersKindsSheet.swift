//
//  EncodersKindsSheet.swift
//  iHog
//
//  Created by Maegan Wilson on 9/28/20.
//

import SwiftUI

struct EncodersKindsSheet: View {
    @EnvironmentObject var osc: OSCHelper
    @Environment(\.presentationMode) private var presentationMode
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("Close")
                }
                .foregroundColor(.red)
                .padding(.horizontal)
            }.padding(.vertical)
//            Spacer()
            EncoderWheelsView().environmentObject(osc)
            Spacer()
            KindButtonView().environmentObject(osc)
            Spacer()
        }
    }
}

struct EncodersKindsSheet_Previews: PreviewProvider {
    static var previews: some View {
        EncodersKindsSheet()
    }
}
