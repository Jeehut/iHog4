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
    private var consoleIP: String
    private var consoleInputPort: Int
    private var consoleOutputPort: Int
    private var useTCP: Bool

    private var udpClient: OSCUdpClient?
    private var updServer: OSCUdpServer?
    private var tcpClient: OSCTcpClient?
    private var tcpServer: OSCTcpServer?

    init(ip: String, inputPort: Int, outputPort: Int) {
        consoleIP = ip
        consoleInputPort = inputPort
        consoleOutputPort = outputPort
        useTCP = false
    }
}
