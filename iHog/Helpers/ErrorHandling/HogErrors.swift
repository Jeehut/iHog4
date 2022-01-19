//
//  HogErrors.swift
//  iHog
//
//  Created by Maegan Wilson on 1/19/22.
//

import Foundation

public enum OSCErrors: String, Error {
case TCPFailedToSend = "TCP didn't send message"
case FailedToCreateMessage = "Message was not created"
case UDPFailedToSend = "UDP didn't send message"
}
