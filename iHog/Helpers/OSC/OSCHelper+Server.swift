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
