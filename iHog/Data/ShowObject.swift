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
    var id: UUID = UUID()
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
        return objType.rawValue.localizedCapitalized + " " + getObjNumber()
    }
    
    func getObjNumber() -> String {
        var numString: String = ""
        let objNum = number
        let isInt = objNum.truncatingRemainder(dividingBy: 1) == 0
        
        if isInt {
            numString = String(format: "%.0f", number)
        } else {
            numString = String(format: "%.3f", number)
        }
        
        return numString
    }
    
    func getShortType() -> String {
        switch objType {
        case .group:
            return "GRP"
        case .intensity:
            return "INT"
        case .position:
            return "POS"
        case .color:
            return "COL"
        case .beam:
            return "BEM"
        case .effect:
            return "EFF"
        case .list:
            return "LST"
        case .scene:
            return "SCN"
        default:
            // NO TYPE FOUND
            return "NTF"
        }
    }
}

let testShowObjects: [ShowObject] = [
    ShowObject(objType: ShowObjectType.group, number: 1, objColor: "red"),
    ShowObject(objType: ShowObjectType.position, number: 1, objColor: "red", isOutlined: false),
    ShowObject(objType: ShowObjectType.position, number: 2.0, objColor: "red"),
    ShowObject(objType: ShowObjectType.position, number: 10.0, objColor: "red"),
    ShowObject(objType: ShowObjectType.position, number: 21.0, objColor: "red", isOutlined: false),
    ShowObject(objType: ShowObjectType.intensity, number: 21.0, objColor: "red"),
    ShowObject(objType: ShowObjectType.color, number: 21.0, objColor: "red"),
    ShowObject(objType: ShowObjectType.beam, number: 21.0, objColor: "red", isOutlined: false),
    ShowObject(objType: ShowObjectType.beam, number: 2.0, objColor: "red"),
    ShowObject(objType: ShowObjectType.beam, number: 103.0, objColor: "red")
]
