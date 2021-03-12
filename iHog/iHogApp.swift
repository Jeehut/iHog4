//
//  iHogApp.swift
//  iHog
//
//  Created by Maegan Wilson on 9/16/20.
//  Supporters:
//  DustinD_Miller
//  panjakesnbacon
//

import SwiftUI
import Purchases

@main
struct iHogApp: App {
    let persistenceController = PersistenceController.shared
    let osc = OSCHelper()
    
    init() {
        Purchases.debugLogsEnabled = true
        Purchases.configure(withAPIKey: RC_API_KEY, appUserID: nil)
    }

    var body: some Scene {
        WindowGroup {
            SettingsView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(osc)
        }
    }
}
