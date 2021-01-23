//
//  OSCHelper.swift
//  iHog
//
//  Created by Maegan Wilson on 12/17/20.
//

import Foundation
import Combine
import OSCKit

class OSCHelper: ObservableObject, OSCPacketDestination {
    
    let objectWillChange: ObservableObjectPublisher = ObservableObjectPublisher()
    
    private var consoleIP: String = "172.31.0.1"
    private var consoleInputPort: Int = 7001
    private var consoleOutputPort: Int = 7002
    private var useTCP: Bool = true
    
    // MARK: HOG OSC Command beginnings
    
    private let hardware = "/hog/hardware/"
    private let playbackGo = "/hog/playback/go/"
    private let playbackHalt = "/hog/playback/halt/"
    private let playbackBack = "/hog/playback/back/"
    private let playbackRelease = "/hog/playback/release/"
    private let status = "/hog/status/"
    
    public var client = OSCClient(){
        willSet{
            self.objectWillChange.send()
        }
    }
    public var server = OSCServer(){
        willSet{
            self.objectWillChange.send()
        }
    }
    
    // MARK: Hog Status Variables
    
    public var encoderWheelLabels = ["", "", "", "", ""]{
        willSet{
            self.objectWillChange.send()
        }
    }
    public var encoderWheelValues = ["", "", "", "",""]{
        willSet{
            self.objectWillChange.send()
        }
    }
    public var commandLine = "Command line text" {
        willSet{
            self.objectWillChange.send()
        }
    }
    public var blind: Float = 0.0 {
        willSet{
            self.objectWillChange.send()
        }
    }
    public var highlight: Float = 0.0 {
        willSet{
            self.objectWillChange.send()
        }
    }
    public var clear: Float = 0.0 {
        willSet{
            self.objectWillChange.send()
        }
    }
    public var macro: Float = 0.0 {
        willSet{
            self.objectWillChange.send()
        }
    }
    public var plays: [Float] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0] {
        willSet {
            self.objectWillChange.send()
        }
    }
    public var pauses: [Float] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0] {
        willSet {
            self.objectWillChange.send()
        }
    }
    public var backs: [Float] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0] {
        willSet {
            self.objectWillChange.send()
        }
    }
    public var flashes: [Float] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0] {
        willSet {
            self.objectWillChange.send()
        }
    }
    public var chooses: [Float] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0] {
        willSet {
            self.objectWillChange.send()
        }
    }
    // MARK: INIT
    init(){
        client.interface = "en0"
        client.host = consoleIP
        client.port = UInt16(consoleInputPort)
        client.delegate = self
        // Server info
        server.port = UInt16(consoleOutputPort)
        server.delegate = self
    }
    
    func setConsoleSettings(ip: String, port: Int) {
        consoleIP = ip
        consoleInputPort = port
        client.host = consoleIP
        client.port = UInt16(consoleInputPort)
        print(client.description)
        client.delegate = self
        let message = OSCMessage(with: "/hog/OSCisConnected", arguments: ["True"])
        client.send(packet: message)
        
        do {
            try server.startListening()
        } catch {
            print("Error from startListening \(error)")
        }
    }
}

// MARK: Protocol stubs
extension OSCHelper: OSCClientDelegate {
    func clientDidConnect(client: OSCClient) {
        print("Client did connect")
    }
    
    func clientDidDisconnect(client: OSCClient) {
        print("Client did disconnect")
    }
    
    func take(message: OSCMessage) {
        print("message: \(message.addressParts)")
        
    }
    
    func take(bundle: OSCBundle) {
        readBundle(bundle: bundle)
    }
    
    func readBundle(bundle: OSCBundle){
        for item in bundle.elements {
            if let message = item as? OSCMessage {
                switch message.addressParts[2] {
                case "led":
                    getStatusOfLEDButton(message)
                case "commandline":
                    commandLine = message.arguments[0] as! String
                case let encoder where encoder.contains("encoder"):
                    getEncoderWheel(message)
                case "h1":
                    print("function key will have two lines")
                case "chatline1":
                    print("Chat line 1 message will be here")
                case "time":
                    break
                default:
                    print("IDK What to do with this message")
                }
            } else {
                readBundle(bundle: item as! OSCBundle)
            }
        }
    }
}
// MARK: Receiving statuses
extension OSCHelper {
    func getStatusOfLEDButton(_ message: OSCMessage) {
        switch message.addressParts[3] {
        case "pause":
            let buttonIndex = Int(message.addressParts[4]) ?? 0
            pauses[buttonIndex] = message.arguments[0] as! Float
//            print(pauses[buttonIndex])
        case "choose":
            let buttonIndex = Int(message.addressParts[4]) ?? 0
            chooses[buttonIndex] = message.arguments[0] as! Float
//            print(chooses[buttonIndex])
        case "go":
            let buttonIndex = Int(message.addressParts[4]) ?? 0
            plays[buttonIndex] = message.arguments[0] as! Float
//            print(plays[buttonIndex])
        case "goback":
            let buttonIndex = Int(message.addressParts[4]) ?? 0
            backs[buttonIndex] = message.arguments[0] as! Float
//            print(backs[buttonIndex])
        case "flash":
            let buttonIndex = Int(message.addressParts[4]) ?? 0
            flashes[buttonIndex] = message.arguments[0] as! Float
//            print(flashes[buttonIndex])
        case "blind":
            blind = message.arguments[0] as! Float
        case "highlight":
            highlight = message.arguments[0] as! Float
        case "clear":
            clear = message.arguments[0] as! Float
        default:
            print("THERES AN ERROR")
            print(message.addressParts)
            print(message.arguments)
        }
    }
    func getEncoderWheel(_ message: OSCMessage) {
        let messageType = message.addressParts[3]
        print(type(of: messageType))
        switch message.addressParts[2] {
        case "encoderwheel1":
            if messageType == "label" {
                setEncoderWheelLabel(0, label: message.arguments[0] as! String)
            } else {
                setEncdoerWheelValue(0, value: message.arguments[0] as! String)
            }
        case "encoderwheel2":
            if messageType == "label" {
                setEncoderWheelLabel(1, label: message.arguments[0] as! String)
            } else {
                setEncdoerWheelValue(1, value: message.arguments[0] as! String)
            }
        case "encoderwheel3":
            if messageType == "label" {
                setEncoderWheelLabel(2, label: message.arguments[0] as! String)
            } else {
                setEncdoerWheelValue(2, value: message.arguments[0] as! String)
            }
        case "encoderwheel4":
            if messageType == "label" {
                setEncoderWheelLabel(3, label: message.arguments[0] as! String)
            } else {
                setEncdoerWheelValue(3, value: message.arguments[0] as! String)
            }
        case "encoderwheel5":
            if messageType == "label" {
                setEncoderWheelLabel(4, label: message.arguments[0] as! String)
            } else {
                setEncdoerWheelValue(4, value: message.arguments[0] as! String)
            }
        default:
            print("ENCODER WHEEL DOESN'T EXIST")
        }
    }
    func setEncoderWheelLabel(_ encoder: Int, label: String){
        encoderWheelLabels[encoder] = label
    }
    func setEncdoerWheelValue(_ encoder: Int, value: String) {
        encoderWheelValues[encoder] = value
    }
}
// MARK: Hardware Messages

extension OSCHelper {
    // MARK: Playback
    func chooseButton(master: Int){
        let messagePushDown = OSCMessage(with: "\(hardware)choose/\(master)", arguments: [1])
        let messageRelease = OSCMessage(with: "\(hardware)choose/\(master)", arguments: [0])
        client.send(packet: messagePushDown)
        client.send(packet: messageRelease)
    }
    
    func playbackButton(button: String, master: Int){
        let messagePushDown = OSCMessage(with: "\(hardware + button)/\(master)", arguments: [1])
        client.send(packet: messagePushDown)
        let messageRelease = OSCMessage(with: "\(hardware + button)/\(master)", arguments: [0])
        client.send(packet: messageRelease)
    }
    
    func fader(master: Int, value: Float){
        let message = OSCMessage(with: "\(hardware)\(master)", arguments: [value])
        client.send(packet: message)
    }
    
    // MARK: Programming OSC commands
    func encoderWheel(encoderNum: Int, value: Double) {
        let message = OSCMessage(with: "\(hardware)encoderwheel/\(encoderNum)", arguments: [value])
        client.send(packet: message)
    }
    
    func frontPanelButton(button: String){
        let messagePushDown = OSCMessage(with: "\(hardware)\(button)", arguments: [1])
        client.send(packet: messagePushDown)
        
        let messageRelease = OSCMessage(with: "\(hardware)\(button)", arguments: [0])
        client.send(packet: messageRelease)
    }
}

// MARK: Show Objects
extension OSCHelper {
    func selectProgrammingObject(objNumber: String, objType: ShowObjectType) {
        // double tap backspace
        frontPanelButton(button: "backspace")
        frontPanelButton(button: "backspace")
        // object type
        frontPanelButton(button: objType.rawValue)
        print(objType.rawValue)
        // number
        for strng in objNumber {
            if strng == "." {
                frontPanelButton(button: "period")
            } else {
                let formatter = NumberFormatter()
                formatter.numberStyle = .spellOut
                let english = formatter.string(from: NSNumber(value: Int(objNumber)!))
//                print(english ?? "NUMBER DIDN'T CONVERT")
                frontPanelButton(button: english!)
            }
        }
        // enter
        frontPanelButton(button: "enter")
        print("push group button \(objNumber)")
    }
    func goListOrScene(objNumber: String, objType: String) {
        let message = OSCMessage(with: "\(playbackGo)\(objType)", arguments: [Float(objNumber)!])
        client.send(packet: message)
    }
}
