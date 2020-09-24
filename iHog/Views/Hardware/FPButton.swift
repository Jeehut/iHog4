//
//  FPButton.swift
//  iHog
//
//  Created by Maegan Wilson on 9/24/20.
//

import SwiftUI

struct FPButton: View {
    var buttonText: String
    
    var body: some View {
        Button(action: {
            print("Do Something")
        }){
            Text(buttonText)
        }
        .frame(width: 55, height: 55, alignment: .center)
        .padding(5)
        .foregroundColor(.white)
        .background(Color.gray)
        .cornerRadius(5.0)
    }
}

struct FPButton_Previews: PreviewProvider {
    static var previews: some View {
        FPButton(
            buttonText: "Record"
        )
    }
}
