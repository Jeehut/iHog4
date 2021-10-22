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
    @Environment(\.verticalSizeClass) var horizontalSizeClass
    
    @EnvironmentObject var osc: OSCHelper
    
    var body: some View {
        switch horizontalSizeClass {
            case .regular:
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
            default:
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
                    }
                    Spacer()
                    HStack{
                        VStack{
                            ObjectButtonView()
                            Spacer()
                            ActionButtonView()
                        }
                        Spacer()
                        UtilityButtonView()
                    }
                }
                .padding(.all, BASE_PADDING*2)
        }
    }
}

struct ObjActUtilKeys_Previews: PreviewProvider {
    static var previews: some View {
        ObjActUtilKeys()
    }
}
