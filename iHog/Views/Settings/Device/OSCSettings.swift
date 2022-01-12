//
//  OSCSettings.swift
//  iHog
//
//  Created by Maegan Wilson on 3/24/21.
//

import SwiftUI

struct OSCSettings: View {
//    @EnvironmentObject var osc: OSCHelper

    var osc: OSCHelper = OSCHelper(ip: "192.168.0.1", inputPort: 2992, outputPort: 2992)
    
    @AppStorage(Settings.consoleIP.rawValue) var consoleIP: String = "172.31.0.1"
    @AppStorage(Settings.serverPort.rawValue) var serverPort: String = "7001"
    @AppStorage(Settings.clientPort.rawValue) var clientPort: String = "7002"
    @AppStorage(Settings.isOSCOn.rawValue) var isOSCOn: Bool = false
    var body: some View {
        Section(header: Text("OSC Settings")) {
            Text("If using cellular data, it is recommended to turn it off to ensure Wi-Fi is being used.")
            // MARK: IP Settings
            HStack{
                Text("This device's IP address")
                Spacer()
                Text("\(UIDevice().ipAddress() ?? "IS NOT CONNECTED TO A NETWORK")").foregroundColor(.secondary)
            }
            HStack{
                Text("Console's HogNet IP Address")
                TextField("Console's HogNet IP Address", text: $consoleIP)
                    .multilineTextAlignment(.trailing)
            }
            // MARK: Port Settings
            HStack{
                Text("Console's Input Port")
                TextField("Console's Input Port", text: $serverPort)
                    .multilineTextAlignment(.trailing)
            }
            HStack{
                Text("Console's Output Port")
                TextField("Console's HogNet IP Address", text: $clientPort)
                    .multilineTextAlignment(.trailing)
            }
            Toggle("OSC is \(isOSCOn ? "on" : "off")", isOn: Binding(
                    get: {
                        isOSCOn
                    },
                    set:{(newValue) in
                        isOSCOn = newValue
                        toggleOSC()
                    }
            ))
        }.onAppear(perform: toggleOSC)
    }
    
    func toggleOSC(){
        if isOSCOn {
            osc.setConsoleSettings(ip: consoleIP, inputPort: Int(serverPort) ?? 7001, outputPort: Int(clientPort) ?? 7002)
        } else {
            osc.server.stopListening()
        }
    }
}

struct OSCSettings_Previews: PreviewProvider {
    static var previews: some View {
        OSCSettings()
    }
}
