//
//  Device.swift
//  iHog
//
//  Created by Maegan Wilson on 9/16/20.
//

import SwiftUI

struct Device: View {
    @EnvironmentObject var osc: OSCHelper
    
    var body: some View {
        Form{
            OSCSettings()
            ProgrammerSettings()
            GameControllerSettigns(gameController: GameController(osc: osc))
        }.navigationTitle("Device Settings")
    }
}

struct Device_Previews: PreviewProvider {
    static var previews: some View {
        Device()
            .preferredColorScheme(.light)
    }
}
