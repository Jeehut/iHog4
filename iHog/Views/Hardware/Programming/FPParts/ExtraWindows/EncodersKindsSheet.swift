//
//  EncodersKindsSheet.swift
//  iHog
//
//  Created by Maegan Wilson on 9/28/20.
//

import SwiftUI

struct EncodersKindsSheet: View {
    /** OSC Info*/
    @EnvironmentObject var osc: OSCHelper
    
    /** Used to determine rotation */
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    /** Used to determine when the sheet is dismissed*/
    @Environment(\.presentationMode) private var presentationMode
    var body: some View {
        switch horizontalSizeClass {
        case .regular:
            VStack{
                // Close button
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
        default:
            VStack{
                // Close button
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
                HStack{
                    EncoderWheelsView().environmentObject(osc)
                    Spacer()
                    KindButtonView().environmentObject(osc)
                    Spacer()
                }
            }
        }
    }
}

struct EncodersKindsSheet_Previews: PreviewProvider {
    static var previews: some View {
        EncodersKindsSheet()
    }
}
