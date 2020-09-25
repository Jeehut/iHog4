//
//  OpenPartsView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/25/20.
//

import SwiftUI

struct OpenPartsView: View {
    var body: some View {
        VStack(alignment: .leading){
            Button(action: {
                print("Open Kind Keys and Encoders")
            }){
                Text("Kind Keys & Encoders")
            }
            .buttonStyle(OpenButtonStyle())
            Spacer()
            Button(action: {
                print("Open Function Keys")
            }){
                Text("Function Keys")
            }
            .buttonStyle(OpenButtonStyle())
            Spacer()
            
            Button(action: {
                print("Open Utility Keys")
            }){
                Text("Utility Keys")
            }
            .buttonStyle(OpenButtonStyle())
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
            .frame(width: 200, height: 55, alignment: .center)
            .background(Color.gray)
            .cornerRadius(5.0)
    }
}
