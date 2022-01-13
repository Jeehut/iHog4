//
//  OSCHelper.swift
//  iHog
//
//  Created by Maegan Wilson on 12/17/20.
//

import Foundation
import Combine
import OSCKit

class OSCHelper: ObservableObject, OSCTcpClientDelegate {

    // MARK: Published variables

    @Published var encoderWheelLabels = ["", "", "", "", ""]
    @Published var encoderWheelValues = ["", "", "", "",""]
    @Published var commandLine = "Command line text"
    @Published var blind: Float = 0.0
    @Published var highlight: Float = 0.0
    @Published var clear: Float = 0.0
    @Published var macro: Float = 0.0
    @Published var kindKeys: [String: Float] = [ButtonFunctionNames.intensity.rawValue: 0.0,
                                                ButtonFunctionNames.position.rawValue: 0.0,
                                                ButtonFunctionNames.colour.rawValue: 0.0,
                                                ButtonFunctionNames.beam.rawValue: 0.0,
                                                ButtonFunctionNames.effect.rawValue: 0.0,
                                                ButtonFunctionNames.time.rawValue: 0.0]
    @Published var functionKeys: [String: [String]] = [
        ButtonFunctionNames.h1.rawValue: ["", ""],
        ButtonFunctionNames.h2.rawValue: ["", ""],
        ButtonFunctionNames.h3.rawValue: ["", ""],
        ButtonFunctionNames.h4.rawValue: ["", ""],
        ButtonFunctionNames.h5.rawValue: ["", ""],
        ButtonFunctionNames.h6.rawValue: ["", ""],
        ButtonFunctionNames.h7.rawValue: ["", ""],
        ButtonFunctionNames.h8.rawValue: ["", ""],
        ButtonFunctionNames.h9.rawValue: ["", ""],
        ButtonFunctionNames.h10.rawValue: ["", ""],
        ButtonFunctionNames.h11.rawValue: ["", ""],
        ButtonFunctionNames.h12.rawValue: ["", ""]
    ]
    @Published var functionKeyStatus: [String: Float] = [
        ButtonFunctionNames.h1.rawValue: 0.0,
        ButtonFunctionNames.h2.rawValue: 0.0,
        ButtonFunctionNames.h3.rawValue: 0.0,
        ButtonFunctionNames.h4.rawValue: 0.0,
        ButtonFunctionNames.h5.rawValue: 0.0,
        ButtonFunctionNames.h6.rawValue: 0.0,
        ButtonFunctionNames.h7.rawValue: 0.0,
        ButtonFunctionNames.h8.rawValue: 0.0,
        ButtonFunctionNames.h9.rawValue: 0.0,
        ButtonFunctionNames.h10.rawValue: 0.0,
        ButtonFunctionNames.h11.rawValue: 0.0,
        ButtonFunctionNames.h12.rawValue: 0.0]


    @Published var plays: [Float] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                     0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                     0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                     0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                     0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                     0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                     0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                     0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                     0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                     0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]

    @Published var pauses: [Float] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                      0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                      0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                      0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                      0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                      0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                      0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                      0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                      0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                      0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]

    @Published var backs: [Float]   = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]

    @Published var flashes: [Float] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]

    @Published var chooses: [Float] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                       0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]

    @Published var faders: [Float] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                      0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                      0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                      0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                      0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                      0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                      0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                      0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                      0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                                      0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
    @Published var oscLog: [[String: String]] = []

    enum OSCCommands: String {
        case go = "/hog/playback/go/"
        case halt = "/hog/playback/halt/"
        case back = "/hog/playback/back/"
        case release = "/hog/playback/release/"
        case hardware = "/hog/hardware/"
        case pig = "/hog/hardware/pig"
        case hRelease = "/hog/hardware/release"
        case choose = "/hog/hardware/choose/"
        case goHardware = "/hog/hardware/go/"
        case pauseHardware = "/hog/hardware/pause/"
        case backHardware = "/hog/hardware/goback/"
        case flashHardware = "/hog/hardware/flash/"
        case encoderWheelButton = "/hog/hardware/ewheelbutton/"
        case status = "/hog/status/"
    }

    enum OSCStatuses: String {
        case led
        case commandline
        case encoderWheel1
        case encoderWheel2
        case encoderWheel3
        case encoderWheel4
        case encoderWheel
        case h1
        case h2
        case h3
        case h4
        case h5
        case h6
        case h7
        case h8
        case h9
        case h10
        case h11
        case h12
    }

    enum oscButtonNames: String {
        case pause
        case choose
        case go
        case goback
        case flash
        case blind
        case highlight
        case clear
        case macro
        case intensity
        case position
        case colour
        case beam
        case effects
        case time
    }

    // MARK: Private variables

    private var consoleIP: String = ""
    private var consoleInputPort: Int = 0
    private var consoleOutputPort: Int = 0
    private var useTCP: Bool = false

    private var udpClient: OSCUdpClient?
    private var udpServer: OSCUdpServer?
    private var tcpClient: OSCTcpClient?
    private var tcpServer: OSCTcpServer?

    private let interface = "en0"

    init(ip: String, inputPort: Int, outputPort: Int) {
        consoleIP = ip
        consoleInputPort = inputPort
        consoleOutputPort = outputPort
        useTCP = false
    }

    // MARK: OSC Settings
    func setOSCClientServer() {
        if useTCP {
            tcpClient = OSCTcpClient(interface: interface,
                                     host: consoleIP,
                                     port: UInt16(consoleInputPort),
                                     streamFraming: .SLIP,
                                     delegate: self)
            tcpServer = OSCTcpServer(interface: interface,
                                     port: UInt16(consoleOutputPort),
                                     streamFraming: .SLIP,
                                     delegate: self)
        } else {
            udpClient = OSCUdpClient(interface: interface,
                                     host: consoleIP,
                                     port: UInt16(consoleInputPort),
                                     delegate: self)
            udpServer = OSCUdpServer(interface: interface,
                                     port: UInt16(consoleOutputPort),
                                     delegate: self)
        }
    }

    func setConsoleSettings(ip: String, inputPort: Int, outputPort: Int, useTCP: Bool = false) {
        consoleIP = ip
        consoleInputPort = inputPort
        consoleOutputPort = outputPort
        self.useTCP = useTCP

        setOSCClientServer()
    }

    func stopServer() {
        guard let tcpServer = tcpServer else {
            udpServer!.stopListening()
            return
        }

        tcpServer.stopListening()
    }

    // MARK: Send a message
    func send(_ stringMessage: String, arguments: [OSCArgumentProtocol] = []) {
        // check if using TCP
        guard let tcpClient = tcpClient else {
            // runs if using UDP
            do {
                let message = try OSCMessage(with: stringMessage, arguments: arguments)
                try udpClient!.send(message)
            } catch OSCAddressError.invalidAddress {
                print("Unable to make message invalid address: \(stringMessage) \(arguments)")
            } catch {
                print("Other error \(error.localizedDescription)")
            }
            return
        }

        // runs if using TCP
        do {
            let message = try OSCMessage(with: stringMessage, arguments: arguments)
            try tcpClient.send(message)
        } catch OSCAddressError.invalidAddress {
            print("Unable to make message invalid address: \(stringMessage) \(arguments)")
        } catch {
            print("Other error \(error.localizedDescription)")
        }
    }

    func pushFrontPanelButton(button: String) {
        let stringMessage = OSCCommands.hardware.rawValue + button
        send(stringMessage, arguments: [1])
    }

    func releaseFrontPanelButton(button: String) {
        let stringMessage = OSCCommands.hardware.rawValue + button
        send(stringMessage, arguments: [0])
    }

    func sendReleaseAllMessage() {
        // Push the buttons
        send(OSCCommands.pig.rawValue, arguments: [1])
        send(OSCCommands.hRelease.rawValue, arguments: [1])

        // Release the buttons
        send(OSCCommands.pig.rawValue, arguments: [0])
        send(OSCCommands.hRelease.rawValue, arguments: [0])
    }
}
