//
//  EncodersKindsSheet.swift
//  iHog
//
//  Created by Maegan Wilson on 9/28/20.
//

import SwiftUI

struct EncodersKindsSheet: View {
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
            }.padding(.vertical)
            Spacer()
            EncoderWheelsView()
            Spacer()
            KindButtonView()
            Spacer()
        }
    }
}

struct EncodersKindsSheet_Previews: PreviewProvider {
    static var previews: some View {
        EncodersKindsSheet()
    }
}
