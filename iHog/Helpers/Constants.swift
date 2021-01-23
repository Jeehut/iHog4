//
//  Constants.swift
//  iHog
//
//  Created by Maegan Wilson on 10/14/20.
//

import Foundation
import UIKit
import SwiftUI

// MARK: GENERAL
let BASE_CORNER_RADIUS: CGFloat = 5
let DOUBLE_CORNER_RADIUS: CGFloat = 10
let HALF_PADDING: CGFloat       = 5
let BASE_PADDING: CGFloat       = 10
let BASE_LINE_WIDTH: CGFloat    = 5

// MARK: FADERS or SLIDERS
let BASE_SLIDER_HEIGHT: CGFloat = 250
let BASE_SLIDER_WIDTH: CGFloat  = 25
let BASE_THUMB_SIZE: CGFloat    = 30

// MARK: FRONT PANEL BUTTON SIZES
let BASE_BUTTON_SIZE: CGFloat   = 55
let SMALL_BUTTON_SIZE: CGFloat  = 50
let XL_BUTTON_WIDTH: CGFloat    = 200
let L_BUTTON_WIDTH: CGFloat     = 125

// MARK: OBJ BUTTON SIZES
let SMALL_OBJ_BUTTON_SIZE: CGFloat  = 50.0
let MEDIUM_OBJ_BUTTON_SIZE: CGFloat = 75.0
let LARGE_OBJ_BUTTON_SIZE: CGFloat  = 100.0
let XL_OBJ_BUTTON_SIZE: CGFloat     = 150.0

// MARK: MAX BUTTONS ACROSS
let SMALL_MAX_BUTTONS_ACROSS: Int = 4
let MEDIUM_MAX_BUTTONS_ACROSS: Int = 3
let LARGE_MAX_BUTTONS_ACROSS: Int = 1
let XL_MAX_BUTTONS_ACROSS: Int = 1

// MARK: COLOR OPTIONS
let OBJ_COLORS: [Color] = [.red, .green, .blue, .yellow, .gray, .orange, .pink, .purple]

// MARK: SETTING ENUMS
enum Settings: String {
    case chosenShowID
    
    case consoleIP
    case serverPort
    case clientPort
    case isOSCOn
    
    case encoderWheelPrecision
    case isNanoModeOn
    case isHapticOn
    
    // MARK: Button Group
    case buttonColorGroup
    case buttonSizeGroup
    case buttonsAcrossGroup
    case isButtonFilledGroup
    
    // MARK: Button Palette
    case buttonColorPalette
    case buttonSizePalette
    case buttonsAcrossPalette
    case isButtonFilledPalette
    
    // MARK: Button List
    case buttonColorList
    case buttonSizeList
    case buttonsAcrossList
    case isButtonFilledList
    
    // MARK: Button Scene
    case buttonColorScene
    case buttonSizeScene
    case buttonsAcrossScene
    case isButtonFilledScene
}

// MARK: BUTTON NAME ENUMS
enum ButtonNames: String {
    // MARK: PLAYBACKS
    case pause
    case goback
    case go
    case flash
    case choose
    case pig
    // MARK: PROGRAMMING
    // OBJECT BUTTONS
    case live
    case scene
    case cue
    case macro
    case list
    case page
    
    case highlight
}
