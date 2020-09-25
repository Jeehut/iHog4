//
//  iHogApp.swift
//  iHog
//
//  Created by Maegan Wilson on 9/16/20.
//

import SwiftUI

@main
struct iHogApp: App {
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            FPProgrammer()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
