//
//  OSCHelper+Server.swift
//  iHog
//
//  Created by Maegan Wilson on 1/11/22.
//

import Foundation
import OSCKit

extension OSCHelper: OSCUdpServerDelegate {
    func server(_ server: OSCUdpServer,
                didReceivePacket packet: OSCPacket,
                fromHost host: String,
                port: UInt16) {
        print("server did receive packet from \(host):\(port)")
    }

    func server(_ server: OSCUdpServer,
                socketDidCloseWithError error: Error?) {
        if let error = error {
           print("server did stop listening with error: \(error.localizedDescription)")
        } else {
           print("server did stop listening")
        }
    }

    func server(_ server: OSCUdpServer,
                didReadData data: Data,
                with error: Error) {
        print("Server did read data with error: \(error.localizedDescription)")
    }
}

extension OSCHelper: OSCTcpServerDelegate {
    func server(_ server: OSCTcpServer,
                didConnectToClientWithHost host: String,
                port: UInt16) {
        print("Server did connect to client \(host):\(port)")
    }

    func server(_ server: OSCTcpServer,
                didDisconnectFromClientWithHost host: String,
                port: UInt16) {
        print("Server did disconnect from client \(host):\(port)")
    }

    func server(_ server: OSCTcpServer,
                didReceivePacket packet: OSCPacket,
                fromHost host: String,
                port: UInt16) {
        print("Server did receive packet")
    }

    func server(_ server: OSCTcpServer,
                didSendPacket packet: OSCPacket,
                toClientWithHost host: String,
                port: UInt16) {
        print("Server did send packet to \(host):\(port)")
    }

    func server(_ server: OSCTcpServer,
                socketDidCloseWithError error: Error?) {
        if let error = error {
           print("server did stop listening with error: \(error.localizedDescription)")
        } else {
           print("server did stop listening")
        }
    }

    func server(_ server: OSCTcpServer,
                didReadData data: Data,
                with error: Error) {
        print("Server did read data with error: \(error.localizedDescription)"
    }
}
