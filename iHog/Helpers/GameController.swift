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
    override init() {
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
        var position: GCControllerButtonInput?
        var colour: GCControllerButtonInput?
        var beam: GCControllerButtonInput?
        var effects: GCControllerButtonInput?
        
        weak var weakController = self
        
        if let gamepad = gameController.extendedGamepad {
            effects = gamepad.buttonA
            beam = gamepad.buttonB
            colour = gamepad.buttonY
            position = gamepad.buttonX
        }
        
        position?.valueChangedHandler = {(_ button: GCControllerButtonInput, _ value: Float, _ pressed: Bool) -> Void in
            guard let strongController = weakController else {
                return
            }
            print("Value \(value) || Pressed \(pressed)")
        }
    }
    
    func unregisterGameController() {
        print("Do something")
    }
}
