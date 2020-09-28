//
//  FunctionKeySheet.swift
//  iHog
//
//  Created by Maegan Wilson on 9/28/20.
//

import SwiftUI

struct FunctionKeySheet: View {
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
            FunctionKeyView()
        }
    }
}

struct FunctionKeySheet_Previews: PreviewProvider {
    static var previews: some View {
        FunctionKeySheet()
    }
}
