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
    
    private var logIsPaused: Bool = false
    
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
    public var kindKeys: [String: Float] = [ButtonFunctionNames.intensity.rawValue: 0.0,
                                            ButtonFunctionNames.position.rawValue: 0.0,
                                            ButtonFunctionNames.colour.rawValue: 0.0,
                                            ButtonFunctionNames.beam.rawValue: 0.0,
                                            ButtonFunctionNames.effect.rawValue: 0.0,
                                            ButtonFunctionNames.time.rawValue: 0.0] {
        willSet{
            self.objectWillChange.send()
        }
    }
    public var functionKeys: [String: [String]] = [
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
    ] {
        willSet {
            self.objectWillChange.send()
        }
    }
    public var functionKeyStatus: [String: Float] = [
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
        ButtonFunctionNames.h12.rawValue: 0.0
    ]{
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
    public var faders: [Float] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0] {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    public var oscLog: [[String: String]] = [] {
        willSet{
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
    
    /// Used to start OSC connection
    /// - Parameters:
    ///   - ip: IP address of the console to know where OSC is going
    ///   - inputPort: What port to send OSC on
    ///   - outputPort: What port to receive OSC on
    func setConsoleSettings(ip: String, inputPort: Int, outputPort: Int) {
        consoleIP = ip
        consoleInputPort = inputPort
        consoleOutputPort = outputPort
        // Set OSC ports and IPs
        client.host = consoleIP
        client.port = UInt16(consoleInputPort)
        client.delegate = self
        server.port = UInt16(consoleOutputPort)
        // Sends message to Hog so that the log viewer can see
        let message = OSCMessage(with: "/hog/OSCisConnected", arguments: ["True"])
        client.send(packet: message)
        
        // Starts listening to the port for LED statuses
        do {
            try server.startListening()
        } catch {
            print("Error from startListening \(error)")
        }
    }
    
    func toggleLog(_ logState: Bool) {
        logIsPaused = logState
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
    
    func logOSCMessage(sent: String, message: String, argument: Any){
//        print("\(type(of: argument))")
        if logIsPaused == false {
            oscLog.append(["sent" : sent,
                           "message" : message,
                           "argument": "\(argument)"])
        }
    }
    
    func readBundle(bundle: OSCBundle){
        for item in bundle.elements {
            if let message = item as? OSCMessage {
                logOSCMessage(sent: "no", message: message.addressPattern, argument: message.arguments[0])
                switch message.addressParts[2] {
                case "led":
                    getStatusOfLEDButton(message)
                case "commandline":
                    commandLine = message.arguments[0] as! String
                case let encoder where encoder.contains("encoder"):
                    getEncoderWheel(message)
                // Need to check all function keys
                case "fader":
                    let faderIndex = Int(message.addressParts[3]) ?? 0
                    let level = message.arguments[0] as! Float
                    setFaderLevel(value: level, fader: faderIndex)
                case ButtonFunctionNames.h1.rawValue,
                     ButtonFunctionNames.h2.rawValue,
                     ButtonFunctionNames.h3.rawValue,
                     ButtonFunctionNames.h4.rawValue,
                     ButtonFunctionNames.h5.rawValue,
                     ButtonFunctionNames.h6.rawValue,
                     ButtonFunctionNames.h7.rawValue,
                     ButtonFunctionNames.h8.rawValue,
                     ButtonFunctionNames.h9.rawValue,
                     ButtonFunctionNames.h10.rawValue,
                     ButtonFunctionNames.h11.rawValue,
                     ButtonFunctionNames.h12.rawValue:
                    setLinesForFunctionKey(message.addressParts[2],
                                           line: message.addressParts[3],
                                           text: message.arguments[0] as! String)
                case "chatline1":
                    print("Chat line 1 message will be here")
                case "time":
                    break
                default:
                    print("\(message.addressPattern) - \(message.arguments)")
                }
            } else {
                readBundle(bundle: item as! OSCBundle)
            }
        }
    }
}
// MARK: Receiving statuses
extension OSCHelper {
    /// Switch case for LED buttton status
    /// - Parameter message: OSC Message received from the console
    func getStatusOfLEDButton(_ message: OSCMessage) {
        switch message.addressParts[3] {
        case "pause":
            let buttonIndex = Int(message.addressParts[4]) ?? 0
            pauses[buttonIndex] = message.arguments[0] as! Float
        case "choose":
            let buttonIndex = Int(message.addressParts[4]) ?? 0
            chooses[buttonIndex] = message.arguments[0] as! Float
        case "go":
            let buttonIndex = Int(message.addressParts[4]) ?? 0
            plays[buttonIndex] = message.arguments[0] as! Float
        case "goback":
            let buttonIndex = Int(message.addressParts[4]) ?? 0
            backs[buttonIndex] = message.arguments[0] as! Float
        case "flash":
            let buttonIndex = Int(message.addressParts[4]) ?? 0
            flashes[buttonIndex] = message.arguments[0] as! Float
        case "blind":
            blind = message.arguments[0] as! Float
        case "highlight":
            highlight = message.arguments[0] as! Float
        case "clear":
            clear = message.arguments[0] as! Float
        case "macro":
            macro = message.arguments[0] as! Float
        case ButtonFunctionNames.intensity.rawValue,
             ButtonFunctionNames.position.rawValue,
             ButtonFunctionNames.colour.rawValue,
             ButtonFunctionNames.beam.rawValue,
             ButtonFunctionNames.time.rawValue:
            kindKeys[message.addressParts[3]] = message.arguments[0] as? Float
        // Needed since Hog sends back /hog/status/led/effects and not effect.
        // effect is needed for the button push
        case "effects":
            kindKeys[ButtonFunctionNames.effect.rawValue] = message.arguments[0] as? Float
        case ButtonFunctionNames.h1.rawValue,
             ButtonFunctionNames.h2.rawValue,
             ButtonFunctionNames.h3.rawValue,
             ButtonFunctionNames.h4.rawValue,
             ButtonFunctionNames.h5.rawValue,
             ButtonFunctionNames.h6.rawValue,
             ButtonFunctionNames.h7.rawValue,
             ButtonFunctionNames.h8.rawValue,
             ButtonFunctionNames.h9.rawValue,
             ButtonFunctionNames.h10.rawValue,
             ButtonFunctionNames.h11.rawValue,
             ButtonFunctionNames.h12.rawValue:
            functionKeyStatus[message.addressParts[3]] = message.arguments[0] as? Float
        default:
            print("THERES AN ERROR")
            print(message.addressParts)
            print(message.arguments)
        }
    }
    // MARK: ENCODER WHEELS
    func getEncoderWheel(_ message: OSCMessage) {
        let messageType = message.addressParts[3]
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
    // MARK: FUNCTION KEYS
    func setLinesForFunctionKey(_ key: String, line: String, text: String) {
        if line == "line1" {
            functionKeys[key]?[0] = text
        } else {
            functionKeys[key]?[1] = text
        }
    }
    func setFaderLevel(value: Float, fader: Int) {
        let y = 0.86274509803922 * value - 110.0
        print(" val: \(value) || y: \(y)")
        faders[fader] = y
    }
}

// MARK: Hardware Messages
extension OSCHelper {
    // MARK: Playback
    func chooseButton(master: Int){
        let messagePushDown = OSCMessage(with: "\(hardware)choose/\(master)", arguments: [1])
        let messageRelease = OSCMessage(with: "\(hardware)choose/\(master)", arguments: [0])
        client.send(packet: messagePushDown)
        logOSCMessage(sent: "yes", message: messagePushDown.addressPattern, argument: messagePushDown.arguments[0])
        client.send(packet: messageRelease)
        logOSCMessage(sent: "yes", message: messageRelease.addressPattern, argument: messageRelease.arguments[0])
    }
    
    func playbackButton(button: String, master: Int){
        let messagePushDown = OSCMessage(with: "\(hardware + button)/\(master)", arguments: [1])
        let messageRelease = OSCMessage(with: "\(hardware + button)/\(master)", arguments: [0])
        
        client.send(packet: messagePushDown)
        logOSCMessage(sent: "yes", message: messagePushDown.addressPattern, argument: messagePushDown.arguments[0])
        client.send(packet: messageRelease)
        logOSCMessage(sent: "yes", message: messageRelease.addressPattern, argument: messageRelease.arguments)
    }
    
    func fader(master: Int, value: Float){
        let message = OSCMessage(with: "\(hardware)fader/\(master)", arguments: [value])
        client.send(packet: message)
        logOSCMessage(sent: "yes", message: message.addressPattern, argument: message.arguments[0])
    }
    
    // MARK: Programming OSC commands
    func encoderWheel(encoderNum: Int, value: Double) {
        let message = OSCMessage(with: "\(hardware)encoderwheel/\(encoderNum)", arguments: [value])
        client.send(packet: message)
        logOSCMessage(sent: "yes", message: message.addressPattern, argument: message.arguments[0])
    }
    
    /// Sends OSC Messages for a front panel button push
    /// - Parameter button: button name to push on console
    func pushFrontPanelButton(button: String){
        let messagePushDown = OSCMessage(with: "\(hardware)\(button)", arguments: [1])
        let messageRelease = OSCMessage(with: "\(hardware)\(button)", arguments: [0])
        
        
        client.send(packet: messagePushDown)
        logOSCMessage(sent: "yes", message: messagePushDown.addressPattern, argument: messagePushDown.arguments[0])
        client.send(packet: messageRelease)
        logOSCMessage(sent: "yes", message: messageRelease.addressPattern, argument: messageRelease.arguments[0])
    }
    
    func sendReleaseAllMessage(){
        var pigButton = OSCMessage(with: "\(hardware)pig", arguments: [1])
        var releaseButton = OSCMessage(with: "\(hardware)release", arguments: [1])
        
        client.send(packet: pigButton)
        logOSCMessage(sent: "yes", message: pigButton.addressPattern, argument: pigButton.arguments[0])
        client.send(packet: releaseButton)
        logOSCMessage(sent: "yes", message: releaseButton.addressPattern, argument: releaseButton.arguments[0])
        
        pigButton = OSCMessage(with: "\(hardware)pig", arguments: [0])
        releaseButton = OSCMessage(with: "\(hardware)release", arguments: [0])
        
        client.send(packet: pigButton)
        logOSCMessage(sent: "yes", message: pigButton.addressPattern, argument: pigButton.arguments[0] )
        client.send(packet: releaseButton)
        logOSCMessage(sent: "yes", message: releaseButton.addressPattern, argument: releaseButton.arguments[0])
    }
}

// MARK: Show Objects
extension OSCHelper {
    func selectProgrammingObject(objNumber: String, objType: ShowObjectType) {
        // double tap backspace
        pushFrontPanelButton(button: "backspace")
        pushFrontPanelButton(button: "backspace")
        // object type
        pushFrontPanelButton(button: objType.rawValue)
        print(objType.rawValue)
        // number
        for strng in objNumber {
            if strng == "." {
                pushFrontPanelButton(button: "period")
            } else {
                let formatter = NumberFormatter()
                formatter.numberStyle = .spellOut
                let english = formatter.string(from: NSNumber(value: Int(objNumber)!))
                //                print(english ?? "NUMBER DIDN'T CONVERT")
                pushFrontPanelButton(button: english!)
            }
        }
        // enter
        pushFrontPanelButton(button: "enter")
        print("push group button \(objNumber)")
    }
    func goListOrScene(objNumber: String, objType: String) {
        let message = OSCMessage(with: "\(playbackGo)\(objType)", arguments: [Float(objNumber)!])
        client.send(packet: message)
        logOSCMessage(sent: "yes", message: message.addressPattern, argument: message.arguments[0])
    }
    
    func releaseList(_ objNumber: String) {
        let message = OSCMessage(with: "\(playbackRelease)1", arguments: [Float(objNumber)!])
        client.send(packet: message)
        logOSCMessage(sent: "yes", message: message.addressPattern, argument: message.arguments[0])
    }
    
    func releaseScene(_ objNumber: String) {
        let message = OSCMessage(with: "\(playbackRelease)2", arguments: [Float(objNumber)!])
        client.send(packet: message)
        logOSCMessage(sent: "yes", message: message.addressPattern, argument: message.arguments[0])
    }
}
