//
//  iHogApp.swift
//  iHog
//
//  Created by Maegan Wilson on 9/16/20.
//  Supporters:
//  DustinDMiller2323 aka DustinD_Miller
//

import SwiftUI

@main
struct iHogApp: App {
    let persistenceController = PersistenceController.shared
    let osc = OSCHelper()

    var body: some Scene {
        WindowGroup {
            SettingsView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(osc)
        }
    }
}
