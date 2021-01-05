//
//  FunctionKeySheet.swift
//  iHog
//
//  Created by Maegan Wilson on 9/28/20.
//

import SwiftUI

struct FunctionKeySheet: View {
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
            Spacer()
            FunctionKeyView().environmentObject(osc)
        }
    }
}

struct FunctionKeySheet_Previews: PreviewProvider {
    static var previews: some View {
        FunctionKeySheet()
    }
}
