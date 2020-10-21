//
//  Constants.swift
//  iHog
//
//  Created by Maegan Wilson on 10/14/20.
//

import Foundation
import UIKit

//MARK: GENERAL
let BASE_CORNER_RADIUS: CGFloat = 5
let DOUBLE_CORNER_RADIUS: CGFloat = 10
let HALF_PADDING: CGFloat       = 5
let BASE_PADDING: CGFloat       = 10
let BASE_LINE_WIDTH: CGFloat    = 5

//MARK: FADERS or SLIDERS
let BASE_SLIDER_HEIGHT: CGFloat = 250
let BASE_SLIDER_WIDTH: CGFloat  = 25
let BASE_THUMB_SIZE: CGFloat    = 30

//MARK: FRONT PANEL BUTTON SIZES
let BASE_BUTTON_SIZE: CGFloat   = 55
let SMALL_BUTTON_SIZE: CGFloat  = 50
let XL_BUTTON_WIDTH: CGFloat    = 200
let L_BUTTON_WIDTH: CGFloat     = 125

//MARK: OBJ BUTTON SIZES
let SMALL_OBJ_BUTTON_SIZE: CGFloat  = 50.0
let MEDIUM_OBJ_BUTTON_SIZE: CGFloat = 100.0
let LARGE_OBJ_BUTTON_SIZE: CGFloat  = 150.0
let XL_OBJ_BUTTON_SIZE: CGFloat     = 200.0

// MARK: SETTING ENUMS
enum Settings {
    static let chosenShowID = "chosenShowID"
    
    static let hognetIPAddress = "172.31.0.1"
    static let inputPort = 7001
    static let outputPort = 7002
    static let isOSCOn = false
    
    static let encoderWheelPrecision = 2.0
    static let isNanoModeOn = false
    
    // MARK: Button Group
    static let buttonColorGroup = "red"
    static let buttonSizeGroup = "small"
    static let buttonsAcrossGroup = 3
    static let isButtonFilledGroup = true
    
    // MARK: Button Palette
    static let buttonColorPalette = "blue"
    static let buttonSizePalette = "small"
    static let buttonsAcrossPalette = 3
    static let isButtonFilledPalette = true
    
    // MARK: Button List
    static let buttonColorList = "green"
    static let buttonSizeList = "small"
    static let buttonsAcrossList = 3
    static let isButtonFilledList = true
    
    // MARK: Button Scene
    static let buttonColorScene = "gray"
    static let buttonSizeScene = "small"
    static let buttonsAcrossScene = 3
    static let isButtonFilledScene = true
}
