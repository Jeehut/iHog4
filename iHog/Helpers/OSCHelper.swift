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
    private var useTCP: Bool = false
    
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
    
    init(){
        client.interface = "en0"
        client.host = consoleIP
        client.port = UInt16(consoleInputPort)
        client.delegate = self
    }
    
    func setConsoleSettings(ip: String, port: Int) {
        consoleIP = ip
        consoleInputPort = port
        client.host = consoleIP
        client.port = UInt16(consoleInputPort)
        print(client.description)
        client.delegate = self
        let message = OSCMessage(with: "/hog/playback", arguments: [1])
        client.send(packet: message)
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
        print("Received message - \(message.addressPattern)")
    }
    
    func take(bundle: OSCBundle) {
        print("Received bundle - time tag: \(bundle.timeTag.hex()) elements: \(bundle.elements.count)")
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
                frontPanelButton(button: String(strng))
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
