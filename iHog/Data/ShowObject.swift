//
//  ShowObject.swift
//  iHog
//
//  Created by Maegan Wilson on 9/21/20.
//

import Foundation

public enum ShowObjectType: String {
    //programming objects
    case group
    case intensity
    case position
    case color
    case beam
    case effect
    
    // playback objects
    case list
    case scene
    case batch

    // others
    case macro
    case plot
}

struct ShowObject: Identifiable, Hashable {
    let id: UUID = UUID()
    var objType: ShowObjectType
    var number: Double
    var name: String?
    var objColor: String
    var isOutlined: Bool = true
    
    mutating func setName(_ newName: String){
        name = newName
    }
    
    func getName() -> String {
        if let objectName = name {
            return objectName
        }
        return objType.rawValue.localizedCapitalized + " \(number)"
    }
}

let testShowObjects: [ShowObject] = [
    ShowObject(objType: ShowObjectType.group, number: 1.0, objColor: "red"),
    ShowObject(objType: ShowObjectType.position, number: 1.0, objColor: "red", isOutlined: false),
    ShowObject(objType: ShowObjectType.position, number: 2.0, objColor: "red"),
    ShowObject(objType: ShowObjectType.position, number: 10.0, objColor: "red"),
    ShowObject(objType: ShowObjectType.position, number: 21.0, objColor: "red", isOutlined: false),
    ShowObject(objType: ShowObjectType.intensity, number: 21.0, objColor: "red"),
    ShowObject(objType: ShowObjectType.color, number: 21.0, objColor: "red"),
    ShowObject(objType: ShowObjectType.beam, number: 21.0, objColor: "red", isOutlined: false),
    ShowObject(objType: ShowObjectType.beam, number: 2.0, objColor: "red"),
    ShowObject(objType: ShowObjectType.beam, number: 103.0, objColor: "red")
]
