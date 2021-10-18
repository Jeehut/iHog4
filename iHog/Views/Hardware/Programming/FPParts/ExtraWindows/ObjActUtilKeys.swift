//
//  ObjActUtilKeys.swift
//  iHog
//
//  Created by Maegan Wilson on 10/18/21.
//

import SwiftUI

struct ObjActUtilKeys: View {
    /** Used to determine when the sheet is dismissed*/
    @Environment(\.presentationMode) private var presentationMode
    
    @EnvironmentObject var osc: OSCHelper
    
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
            ObjectButtonView()
            Spacer()
            ActionButtonView()
            Spacer()
            UtilityButtonView()
        }
        .padding()
    }
}

struct ObjActUtilKeys_Previews: PreviewProvider {
    static var previews: some View {
        ObjActUtilKeys()
    }
}
