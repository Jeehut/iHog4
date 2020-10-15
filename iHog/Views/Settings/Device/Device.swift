//
//  Device.swift
//  iHog
//
//  Created by Maegan Wilson on 9/16/20.
//

import SwiftUI

struct Device: View {
    @State private var consoleIP: String = "172.31.0.1"
    @State private var serverPort: String = "7001"
    @State private var clientPort: String = "7002"
    @State private var isOSCOn: Bool = false
    @State private var encoderWheelPrecision: Double = 2.00
    @State private var isNanoModeOn: Bool = false
    @State private var isHapticOn: Bool = true
    
    var body: some View {
        Form{
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
                    Text("Console's HogNet IP Address")
                    TextField("Console's Input Port", text: $serverPort)
                        .multilineTextAlignment(.trailing)
                }
                HStack{
                    Text("Console's Output Port")
                    TextField("Console's HogNet IP Address", text: $clientPort)
                        .multilineTextAlignment(.trailing)
                }
                Toggle("OSC is \(isOSCOn ? "on" : "off")", isOn: $isOSCOn)
            }
            Section(header: Text("Programmer Settings")){
                VStack(alignment: .leading){
                    Text("Encoder Wheel Precision: \(encoderWheelPrecision)")
                    HStack{
                        Slider(value: $encoderWheelPrecision, in: 0.0...20.0, minimumValueLabel: Text("0"), maximumValueLabel: Text("20")) {
                            Text("Encoder Wheel Precision")
                        }
                    }
                }
                HStack{
                    Toggle("Nano Mode is \(isNanoModeOn ? "on" : "off")", isOn: $isNanoModeOn)
                }
                HStack{
                    Toggle("Haptic Feedback for encoders is \(isHapticOn ? "on" : "off")", isOn: $isHapticOn)
                }
                HStack{
                    Spacer()
                    Button("Apply Settings") {
                        print("Apply")
                    }.foregroundColor(.green)
                }
            }
        }.navigationTitle("Device Settings")
    }
}

struct Device_Previews: PreviewProvider {
    static var previews: some View {
        Device()
            .preferredColorScheme(.light)
    }
}
