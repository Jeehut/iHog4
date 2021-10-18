//
//  CompRegFPprogrammingView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/28/20.
//

import SwiftUI

struct CompRegFPprogramming: View {
    
    @EnvironmentObject var osc: OSCHelper
    
    @State private var isEncoderShown: Bool = false
    @State private var isActionShown: Bool = false
    @State private var isFunctionShown: Bool = false
    
    var body: some View {
        VStack{
            VStack{
                HBCButtonView()
                // Used to open windows with different sets of buttons in them.
                HStack{
                    // Encoders
                    Button {
                        isEncoderShown.toggle()
                    } label: {
                        Image(systemName: "dial.max")
                    }.buttonStyle(FrontPanelButton(width: 65, backgroundColor: .systemGray3))
                        .sheet(isPresented: $isEncoderShown, content: {
                            EncodersKindsSheet()
                                .environmentObject(osc)
                        })
                    Spacer()
                    // Object Keys, Action Keys, & utility keys
                    Button {
                        isActionShown.toggle()
                    } label: {
                        Image(systemName: "rectangle.3.offgrid")
                    }.buttonStyle(FrontPanelButton(width: 65, backgroundColor: .systemGray3))
                        .sheet(isPresented: $isActionShown) {
                            isActionShown = false
                        } content: {
                            ObjActUtilKeys().environmentObject(osc)
                        }

                    Spacer()
                    // Function keys
                    Button {
                        isFunctionShown.toggle()
                    } label: {
                        Image(systemName: "square.grid.3x3")
                    }.buttonStyle(FrontPanelButton(width: 65, backgroundColor: .systemGray3))
                        .sheet(isPresented: $isFunctionShown) {
                            isFunctionShown = false
                        } content: {
                            FunctionKeySheet().environmentObject(osc)
                        }
                }
                HStack{
                    Button("Back"){print("back")}.buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                    Spacer()
                    Button("All"){print("all")}.buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                    Spacer()
                    Button("Next"){print("next")}.buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                }
            }.padding(.bottom, BASE_PADDING)
            Spacer()
            NumericKeypadView()
        }
    }
}

struct CompRegFPprogrammingView_Previews: PreviewProvider {
    static var previews: some View {
        CompRegFPprogramming()
    }
}
