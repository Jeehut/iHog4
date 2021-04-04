//
//  GameControllerSettigns.swift
//  iHog
//
//  Created by Maegan Wilson on 3/24/21.
//

import SwiftUI
import GameController

struct GameControllerSettigns: View {
    @EnvironmentObject var osc: OSCHelper
    // Controller settings
    @State private var isConntected = false
    @State private var controllers: [Any] = []
    var gameController: GameController

    var body: some View {
        Section(header: Text("Game Controller Options")) {
            // Button to look for game controllers
            HStack{
                Text("Connect for game controller")
                Button("Connect") {
                    print("Will CONNECT")
                    print(GCController.controllers())
                    GCController.startWirelessControllerDiscovery {
                        // completion handler
                        print("Did start")
                    }
                }
            }
        }
    }
}

