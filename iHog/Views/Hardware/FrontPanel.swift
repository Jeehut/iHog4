//
//  FrontPanel.swift
//  iHog
//
//  Created by Maegan Wilson on 9/23/20.
//

import SwiftUI

struct FrontPanel: View {
    var body: some View {
        VStack{
            Text("Command Line")
            VStack{
                Text("Object buttons")
                Text("Actions")
                Text("Utility Key")
            }
        }
    }
}

struct FrontPanel_Previews: PreviewProvider {
    static var previews: some View {
        FrontPanel()
    }
}
