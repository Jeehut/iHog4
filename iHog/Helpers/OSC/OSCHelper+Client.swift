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
