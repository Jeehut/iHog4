//
//  CommandLineView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/25/20.
//

import SwiftUI

struct CommandLineView: View {
    var commandLineText: String
    var body: some View {
        Text(commandLineText)
            .frame(width: .infinity, height: 30, alignment: .center)
            .padding()
            .background(Color.purple)
            .cornerRadius(5.0)
            .foregroundColor(.black)
    }
}

struct CommandLineView_Previews: PreviewProvider {
    static var previews: some View {
        CommandLineView(commandLineText: "SolaSpot 1000 1 > 10 @ 100%")
    }
}
