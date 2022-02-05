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
import CoffeeToast

class ToastNotification: ObservableObject {
    @Published var isShown = false
    @Published var color = Color.clear
    @Published var text = ""

    let ms = 1000000

    func animateIn(text: String, color: Color) {
        self.text = text
        self.color = color

        isShown = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.isShown = false
        }
    }
}

@main
struct iHogApp: App {
    @AppStorage(Settings.timesLaunched.rawValue) var timesLaunced: Int = 0
    
    let persistenceController = PersistenceController.shared
    @StateObject var osc = OSCHelper(ip: "192.168.0.101", inputPort: 9009, outputPort: 9009)
    
    init() {
        Purchases.logLevel = .debug
        Purchases.configure(withAPIKey: RC_API_KEY, appUserID: nil)
    }

    @StateObject private var toastNotification = ToastNotification()

    var body: some Scene {
        WindowGroup {
            Toast(toastNotification.text, backgroundColor: toastNotification.color, isShown: $toastNotification.isShown) {

                    SettingsView(selectedSetting: SettingsNav.device)
                        .environment(\.managedObjectContext, persistenceController.container.viewContext)
                        .environmentObject(osc)
                        .environmentObject(toastNotification)
            }
        }
    }
}
