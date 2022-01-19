//
//  OSCHelper.swift
//  iHog
//
//  Created by Maegan Wilson on 12/17/20.
//

import Foundation
import Combine
import OSCKit
import SwiftUI

class OSCHelper: ObservableObject {

    // MARK: Published variables

    @Published var encoderWheelLabels = ["", "", "", "", ""]
    @Published var encoderWheelValues = ["", "", "", "",""]
    @Published var commandLine = "Command line text"
    @Published var blind: Color = .gray
    @Published var highlight: Color = .gray
    @Published var clear: Color = .gray
    @Published var macro: Color = .gray
    @Published var kindKeys: [ButtonFunctionNames: Color] = [ButtonFunctionNames.intensity: .gray,
                                                             ButtonFunctionNames.position: .gray,
                                                             ButtonFunctionNames.colour: .gray,
                                                             ButtonFunctionNames.beam: .gray,
                                                             ButtonFunctionNames.effect: .gray,
                                                             ButtonFunctionNames.time: .gray]
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


    @Published var plays: [Color] = [Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                     Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                     Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                     Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                     Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                     Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                     Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                     Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                     Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                     Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,]

    @Published var pauses: [Color] = [Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                      Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                      Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                      Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                      Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                      Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                      Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                      Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                      Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                      Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,]

    @Published var backs: [Color] = [Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                     Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                     Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                     Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                     Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                     Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                     Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                     Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                     Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                     Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,]

    @Published var flashes: [Color] = [Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                       Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                       Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                       Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                       Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                       Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                       Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                       Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                       Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                       Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,]

    @Published var chooses: [Color] = [Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                       Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                       Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                       Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                       Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                       Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                       Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                       Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                       Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,
                                       Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray,]

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
        case fader = "/hog/hardware/fader/"
        case encoderWheelButton = "/hog/hardware/ewheelbutton/"
        case encoderWheel = "/hog/hardware/encoderwheel/"
        case period = "/hog/hardware/period/"
        case enter = "/hog/hardware/enter/"
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

    // MARK: Private OSC Variables

    private var consoleIP: String = ""
    private var consoleInputPort: Int = 0
    private var consoleOutputPort: Int = 0
    private var useTCP: Bool = false

    private var udpClient: OSCUdpClient?
    private var udpServer: OSCUdpServer?
    private var tcpClient: OSCTcpClient?
    private var tcpServer: OSCTcpServer?

    private let interface = "en0"

    @Published var isLogPaused = false

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

    func startServer() {
        guard let tcpServer = tcpServer else {
            guard let udpServer = udpServer else {
                print("ERROR WITH UDP")
                return
            }
            do {
                print("UDP")
                try udpServer.startListening()
            } catch {
                print(error.localizedDescription)
            }
            return
        }

        do {
            try tcpServer.startListening()
        } catch {
            print(error.localizedDescription)
        }
    }

    func stopServer() {
        guard let tcpServer = tcpServer else {
            guard let udpServer = udpServer else {
                print("UDP SERVER NOT FOUND")
                return
            }
            udpServer.stopListening()
            return
        }

        tcpServer.stopListening()
    }
    func toggleLog(_ logState: Bool) {
        isLogPaused = logState
    }

    enum OSCSendingErrors: String, Error {
        case TCPFailed = "TCP didn't send message"
        case UDPFailedCreateMessage = ""
        case UDPFailed = "UDP didn't send message"
    }

    private func createUDPMessage(with message: String, arguments: [OSCArgumentProtocol] = []) throws -> OSCMessage {
        do {
            return try OSCMessage(with: message, arguments: arguments)
        } catch {
            throw OSCSendingErrors.UDPFailedCreateMessage
        }
    }

    // MARK: Send a message
    func send(_ stringMessage: String, arguments: [OSCArgumentProtocol] = []) {
        if !isLogPaused {
            logMessage(sent: "yes", message: stringMessage, argument: arguments)
        }
        // check if using TCP
        guard let tcpClient = tcpClient else {
            // runs if using UDP
            do {
                let message = try createUDPMessage(with: stringMessage, arguments: arguments)
                guard let udpClient = udpClient else {
                    print("ERROR WITH UDP CLIENT")
                    return
                }
                try udpClient.send(message)
            } catch OSCSendingErrors.UDPFailedCreateMessage {
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

    func pushPlaybackButton(button: String, master: Int) {
        let stringMessage = OSCCommands.hardware.rawValue + button + "/\(master)"
        send(stringMessage, arguments: [1])
    }

    func releaseFrontPanelButton(button: String) {
        let stringMessage = OSCCommands.hardware.rawValue + button
        send(stringMessage, arguments: [0])
    }

    func releasePlaybackButton(button: String, master: Int) {
        let stringMessage = OSCCommands.hardware.rawValue + button + "/\(master)"
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

    func sendFaderValue(master: Int, value: Float) {
        let stringMessage = OSCCommands.fader.rawValue + "\(master)"
        let args = [value]
        send(stringMessage, arguments: args)
    }

    func sendEncoderWheelValue(encoderNum: Int, value: Double) {
        let stringMessage = OSCCommands.encoderWheel.rawValue + "\(encoderNum)"
        let args = [value]
        send(stringMessage, arguments: args)
    }

    func selectProgrammingObject(objNumber: String, objType: ShowObjectType) {
        let objTypeString = objType.rawValue
        var message: String
        let pressedValue = [1]
        let releasedValue = [0]

        if objType == .group {
            message = OSCCommands.hardware.rawValue + "backspace/"
            send(message, arguments: pressedValue)
            usleep(1000)
            send(message, arguments: releasedValue)
            usleep(1000)
            send(message, arguments: pressedValue)
            usleep(1000)
            send(message, arguments: releasedValue)
            usleep(1000)
        }

        message = OSCCommands.hardware.rawValue + objTypeString
        send(message, arguments: pressedValue)
        usleep(1000)
        send(message, arguments: releasedValue)

        for num in objNumber {
            print(num)
            if num == "." {
                message = OSCCommands.period.rawValue
                send(message, arguments: pressedValue)
                usleep(1000)
                send(message, arguments: releasedValue)
            } else {
                let formatter = NumberFormatter()
                formatter.numberStyle = .spellOut
                let english = formatter.string(from: NSNumber(value: Int(String(num))!))
                message = OSCCommands.hardware.rawValue + english!
                send(message, arguments: pressedValue)
                usleep(1000)
                send(message, arguments: releasedValue)
            }
        }

        // ENTER
        message = OSCCommands.enter.rawValue
        send(message, arguments: pressedValue)
        usleep(1000)
        send(message, arguments: releasedValue)
    }

    func goList(objNumber: String) {
        let message = OSCCommands.go.rawValue + "0" + objNumber
        send(message)
    }

    func goScene(objNumber: String) {
        let message = OSCCommands.go.rawValue + "1" + objNumber
        send(message)
    }

    func releaseList(_ objNumber: String) {
        let message = OSCCommands.release.rawValue + "0" + objNumber
        send(message)
    }

    func releaseScene(_ objNumber: String) {
        let message = OSCCommands.release.rawValue + "1" + objNumber
        send(message)
    }

    // MARK: Receive Values

    func readBundle(bundle: OSCBundle) {
        for item in bundle.elements {
            if let message = item as? OSCMessage {
                let messageParts = message.addressPattern.parts
                let arguments = message.arguments
                switch messageParts[2] {
                case "led":
                    getStatusOfLED(parts: messageParts, arguments: arguments)
                case "commandline":
                    commandLine = arguments[0] as! String
                case let str where str.contains("encoderwheel"):
                    setEncoderWheel(parts: messageParts, arguments: arguments)
                case "time":
                    break
                default:
                    print(messageParts)
                }
                if !isLogPaused {
                    logMessage(sent: "no", message: message.addressPattern.fullPath, argument: arguments)
                }
            } else {
                readBundle(bundle: item as! OSCBundle)
            }
        }
    }

    func getStatusOfLED(parts: [String], arguments: [OSCArgumentProtocol]) {
        switch parts[3] {
        case "clear":
            if arguments[0] as! Float == 0.0 {
                clear = .gray
            } else {
                clear = .red
            }
        case "blind":
            if arguments[0] as! Float == 0.0 {
                blind = .gray
            } else {
                blind = .blue
            }
        case "highlight":
            if arguments[0] as! Float == 0.0 {
                highlight = .gray
            } else {
                highlight = .blue
            }
        case "choose":
            let masterNumber = Int(parts[4]) ?? 0
            if arguments[0] as! Float == 0.0 {
                chooses[masterNumber] = .gray
            } else {
                chooses[masterNumber] = .blue
            }
        case "go":
            let masterNumber = Int(parts[4]) ?? 0
            if arguments[0] as! Float == 0.0 {
                plays[masterNumber] = .gray
            } else {
                plays[masterNumber] = .green
            }
        case "goback":
            let masterNumber = Int(parts[4]) ?? 0
            if arguments[0] as! Float == 0.0 {
                backs[masterNumber] = .gray
            } else {
                backs[masterNumber] = .green
            }
        case "pause":
            let masterNumber = Int(parts[4]) ?? 0
            if arguments[0] as! Float == 0.0 {
                pauses[masterNumber] = .gray
            } else {
                pauses[masterNumber] = .red
            }
        case "flash":
            let masterNumber = Int(parts[4]) ?? 0
            if arguments[0] as! Float == 0.0 {
                flashes[masterNumber] = .gray
            } else {
                flashes[masterNumber] = .red
            }
        default:
            print("NOT FOUND: \(parts) \(arguments)")
        }
    }

    func setEncoderWheel(parts: [String], arguments: [OSCArgumentProtocol]) {
        let isLabel = parts[3] == "label"
        print(parts)
        var index = 0
        switch parts[2] {
        case "encoderwheel1":
            index = 0
        case "encoderwheel2":
            index = 1
        case "encoderwheel3":
            index = 2
        case "encoderwheel4":
            index = 3
        case "encoderwheel5":
            index = 4
        default:
            print("NOT FOUND: \(parts) \(arguments)")
        }
        print(arguments)
        guard let argument = arguments[0] as? String else {
            return
        }
        if isLabel {
            encoderWheelLabels[index] = argument
        } else {
            encoderWheelValues[index] = argument
        }
    }

    func setEncoderLabelValue(index: Int, isLabel: Bool, value: String) {
        if isLabel {
            encoderWheelLabels[index] = value
        } else {
            encoderWheelValues[index] = value
        }
    }

    func logMessage(sent: String, message: String, argument: [OSCArgumentProtocol]) {
        var tempArg = ""
        if !argument.isEmpty {
            tempArg = argument.description
        }

        oscLog.append(["sent": sent,
                       "message": message,
                       "argument": tempArg])
    }
}


// MARK: Adjust app values
extension OSCHelper {
    func setFaderLevel(value: Float, fader: Int) {
        let y = 0.86274509803922 * value - 110.0
        faders[fader] = y
    }
}
