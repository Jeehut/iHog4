//
//  OpenPartsView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/25/20.
//

import SwiftUI

struct OpenPartsView: View {
    @EnvironmentObject var osc: OSCHelper
    @State private var selectedPartView: Int = 4
    @State private var isEncoderShown: Bool = false
    @State private var isFunctionShown: Bool = false
    @State private var isUtilityShown: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            Button(action: {
                self.selectedPartView = 0
                self.isEncoderShown = true
            }){
                Text("Kind Keys & Encoders")
            }
            .buttonStyle(OpenButtonStyle())
            .sheet(isPresented: $isEncoderShown, content: {
                EncodersKindsSheet()
                    .environmentObject(osc)
            })
            Spacer()
            Button(action: {
                self.isFunctionShown = true
            }){
                Text("Function Keys")
            }
            .buttonStyle(OpenButtonStyle())
            .sheet(isPresented: $isFunctionShown, content: {
                FunctionKeySheet()
            })
            Spacer()
            
            Button(action: {
                self.isUtilityShown = true
            }){
                Text("Utility Keys")
            }
            .buttonStyle(OpenButtonStyle())
            .sheet(isPresented: $isUtilityShown, content: {
                UtilityKeySheet()
            })
        }
    }
    
}

struct OpenPartsView_Previews: PreviewProvider {
    static var previews: some View {
        OpenPartsView()
    }
}

struct OpenButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: XL_BUTTON_WIDTH,
                   height: BASE_BUTTON_SIZE,
                   alignment: .center
            )
            .background(Color.gray)
            .cornerRadius(BASE_CORNER_RADIUS)
            .foregroundColor(configuration.isPressed ? .secondary : .primary)
    }
}
