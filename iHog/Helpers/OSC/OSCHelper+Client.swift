//
//  OSCHelper+Client.swift
//  iHog
//
//  Created by Maegan Wilson on 1/11/22.
//

import Foundation
import OSCKit

extension OSCHelper: OSCUdpClientDelegate {
    func client(_ client: OSCUdpClient,
                didSendPacket packet: OSCPacket,
                fromHost host: String?,
                port: UInt16?) {
        print("client sent packet to \(client.host):\(client.port)")
    }

    func client(_ client: OSCUdpClient,
                didNotSendPacket packet: OSCPacket,
                fromHost host: String?,
                port: UInt16?,
                error: Error?) {
        print("client did not send packet to \(client.host):\(client.port)")
    }

    func client(_ client: OSCUdpClient,
                socketDidCloseWithError error: Error) {
        print("Client Error: \(error.localizedDescription)")
    }

}

extension OSCHelper: OSCTcpServerDelegate {
    func client(_ client: OSCTcpClient,
                didConnectTo host: String,
                port: UInt16) {
        print("client did connect to \(host):\(port)")
    }

    func client(_ client: OSCTcpClient,
                didDisconnectWith error: Error?) {
        if let error = error {
           print("client did disconnect with error: \(error.localizedDescription)")
        } else {
           print("client did disconnect")
        }
    }

    func client(_ client: OSCTcpClient,
                didSendPacket packet: OSCPacket) {
        print("Client did send packet")
    }

    func client(_ client: OSCTcpClient,
                didReceivePacket packet: OSCPacket) {
        print("Client did receive packet")
    }

    func client(_ client: OSCTcpClient,
                didReadData data: Data,
                with error: Error) {
        print("Client did read data with error: \(error.localizedDescription)")
    }
}
