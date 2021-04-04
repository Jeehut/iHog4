//
//  GameController.swift
//  iHog
//
//  Created by Maegan Wilson on 3/30/21.
//
//  Used to setup external game controller
//

import Foundation
import GameController

class GameController: NSObject {
    private var osc: OSCHelper
    
    // MARK: - SETUP
    func setupGameController() {
        
        NotificationCenter.default.addObserver(
                self, selector: #selector(self.handleControllerDidConnect),
                name: NSNotification.Name.GCControllerDidBecomeCurrent, object: nil)

        NotificationCenter.default.addObserver(
            self, selector: #selector(self.handleControllerDidDisconnect),
            name: NSNotification.Name.GCControllerDidStopBeingCurrent, object: nil)
        guard let controller = GCController.controllers().first else {
            return
        }
        
        registerGameController(controller)
    }
    
    // MARK: - INIT
    init(osc: OSCHelper) {
        self.osc = osc
        super.init()
        setupGameController()
    }
    // MARK: - Game Controller Connection
    @objc
    func handleControllerDidConnect(_ notification: Notification){
        guard let gameController = notification.object as? GCController else {
            return
        }
        unregisterGameController()
        registerGameController(gameController)
//        HapticUtility.initHapticsFor(controller: gameController)
        
//        self.overlay?.showHints()
    }
    
    @objc
    func handleControllerDidDisconnect(){
        print("Do something")
    }
    
    func registerGameController(_ gameController: GCController) {
        // Buttons
        var position: GCControllerButtonInput?
        var colour: GCControllerButtonInput?
        var beam: GCControllerButtonInput?
        var effects: GCControllerButtonInput?
        // Joysticks
        var encoder1: GCControllerDirectionPad?
        var encoder2: GCControllerDirectionPad?
        // L/R Buttons
        var encoder3Decrease: GCControllerButtonInput?
        var encoder3Increase: GCControllerButtonInput?
        // L/R Triggers
        var encoder4Descrease: GCControllerButtonInput?
        var encoder4Increase: GCControllerButtonInput?
        // Direction Pad
        var encoder5: GCControllerDirectionPad?
//        weak var weakController = self
        
        if let gamepad = gameController.extendedGamepad {
            effects = gamepad.buttonA
            beam = gamepad.buttonB
            colour = gamepad.buttonY
            position = gamepad.buttonX
            encoder1 = gamepad.leftThumbstick
            encoder2 = gamepad.rightThumbstick
            encoder3Decrease = gamepad.leftShoulder
            encoder3Decrease = gamepad.rightShoulder
            encoder4Increase = gamepad.leftTrigger
            encoder4Descrease = gamepad.rightTrigger
            encoder5 = gamepad.dpad
        }
        
        // MARK: EFFECTS BUTTON
        effects?.valueChangedHandler = {(_ button: GCControllerButtonInput, _ value: Float, _ pressed: Bool) -> Void in
//            guard let strongController = weakController else {
//                return
//            }
            print("Value \(value) || Pressed \(pressed)")
            if pressed{
                self.osc.pushFrontPanelButton(button: ButtonFunctionNames.effect.rawValue)
            } else {
                self.osc.releaseFrontPanelButton(button: ButtonFunctionNames.effect.rawValue)
            }
        }
        // MARK: POSITION BUTTON
        position?.valueChangedHandler = {(_ button: GCControllerButtonInput, _ value: Float, _ pressed: Bool) -> Void in
//            guard let strongController = weakController else {
//                return
//            }
            print("Value \(value) || Pressed \(pressed)")
            if pressed{
                self.osc.pushFrontPanelButton(button: ButtonFunctionNames.position.rawValue)
            } else {
                self.osc.releaseFrontPanelButton(button: ButtonFunctionNames.position.rawValue)
            }
        }
        // MARK: COLOUR BUTTON
        colour?.valueChangedHandler = {(_ button: GCControllerButtonInput, _ value: Float, _ pressed: Bool) -> Void in
//            guard let strongController = weakController else {
//                return
//            }
            print("Value \(value) || Pressed \(pressed)")
            if pressed{
                self.osc.pushFrontPanelButton(button: ButtonFunctionNames.colour.rawValue)
            } else {
                self.osc.releaseFrontPanelButton(button: ButtonFunctionNames.colour.rawValue)
            }
        }
        //MARK: BEAM Button
        beam?.valueChangedHandler = {(_ button: GCControllerButtonInput,
                                      _ value: Float,
                                      _ pressed: Bool) -> Void in
//            guard let strongController = weakController else {
//                return
//            }
            print("Value \(value) || Pressed \(pressed)")
            if pressed{
                self.osc.pushFrontPanelButton(button: ButtonFunctionNames.beam.rawValue)
            } else {
                self.osc.releaseFrontPanelButton(button: ButtonFunctionNames.beam.rawValue)
            }
        }
        
        // MARK: ENCODER WHEEL CHANGES
        encoder1?.valueChangedHandler = { (_ directionPad: GCControllerDirectionPad,
                                           _ xValue: Float,
                                           _ yValue: Float) -> Void in
            print(xValue)
        }
        encoder2?.valueChangedHandler = { (_ directionPad: GCControllerDirectionPad,
                                           _ xValue: Float,
                                           _ yValue: Float) -> Void in
            print(xValue)
        }
    }
    
    func unregisterGameController() {
        print("Do something")
    }
}
