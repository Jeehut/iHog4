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
import StoreKit

@main
struct iHogApp: App {
    @AppStorage(Settings.timesLaunched.rawValue) var timesLaunced: Int = 0
    
    let persistenceController = PersistenceController.shared
    let osc = OSCHelper()
    
    init() {
        Purchases.logLevel = .debug
        Purchases.configure(withAPIKey: RC_API_KEY, appUserID: nil)
    }

    var body: some Scene {
        WindowGroup {
            SettingsView(selectedSetting: SettingsNav.device)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(osc)
                .onAppear {
                    timesLaunced += 1
                    if timesLaunced > 5 {
                        if let windowScene = UIApplication.shared.windows.first?.windowScene { SKStoreReviewController.requestReview(in: windowScene) }
                    }
                }
        }
    }
}
