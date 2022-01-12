//
//  OSCHelper.swift
//  iHog
//
//  Created by Maegan Wilson on 12/17/20.
//

import Foundation
import Combine
import OSCKit

class OSCHelper {
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

    func send(_ message: OSCMessage) {
        guard let tcpClient = tcpClient else {
            do {
                try udpClient!.send(message)
            } catch {
                print("Unable to send \(error.localizedDescription)")
            }
            return
        }
        do {
            try tcpClient.send(message)
        } catch {
            print("Unable to send \(error.localizedDescription)")
        }
    }

    func stopServer() {
        guard let tcpServer = tcpServer else {
            udpServer!.stopListening()
            return
        }
        
        tcpServer.stopListening()
    }
}
