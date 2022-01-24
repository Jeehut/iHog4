//
//  NewVersionView.swift
//  iHog
//
//  Created by Maegan Wilson on 1/24/22.
//

import SwiftUI

struct NewVersionView: View {
    @AppStorage(Settings.build.rawValue) var buildNumber = 125
    @AppStorage(Settings.version.rawValue) var version = 2022.1

    @Binding var selectedSetting: SettingsNav?

    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    let appBuild = Bundle.main.infoDictionary?["CFBundleVersion"] as! String

    var body: some View {
        VStack {
            CloseButton()
            Text("v\(appVersion) (\(appBuild))")
                .font(.largeTitle)
            List {
                Section {
                    Text("Focus View")
                    Text("OSC improvements")
                } header: {
                    Text("✅ Enhancements")
                }
                Section {
                    Text("Crash when connect to other device on the network")
                    Text("Group selection was not working")
                    Text("Function keys were not receiving labels")
                } header: {
                    Text("❌ Fixes")
                }
                Section {
                    Text("Thanks for supporting iHog and continuing to use it!").lineLimit(nil)
                    Button("⭐ Leave a review ⭐") {
                        let url = URL(string: "itms-apps://itunes.apple.com/app/1487580623")
                        UIApplication.shared.open(url!)
                    }.foregroundColor(.primary)
                    Button("☕ Buy Maegan a Coffee ☕") {
                        let url = URL(string: "itms-apps://itunes.apple.com/app/1487580623")
                        UIApplication.shared.open(url!)
                    }.foregroundColor(.primary)
                } header: {
                    Text("Support iHog's Development")
                }
            }
        }
    }
}
