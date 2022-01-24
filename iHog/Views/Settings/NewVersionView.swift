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
                    Text("Release notes in app")
                } header: {
                    Text("❌ Fixes")
                }
                Section {
                    Text("Thanks for supporting iHog and continuing to use it!").lineLimit(nil)
                    Button("⭐ Leave a review ⭐") {
                        let url = URL(string: "itms-apps://itunes.apple.com/app/1487580623")
                        UIApplication.shared.open(url!)
                    }.foregroundColor(.primary)
                    Button("\(Image(systemName: "cup.and.saucer")) Buy Maegan a Coffee") {
                        let url = URL(string: "itms-apps://itunes.apple.com/app/1487580623")
                        UIApplication.shared.open(url!)
                    }.foregroundColor(.primary)
                } header: {
                    Text("Support iHog's Development")
                }
            }
            HStack(spacing: 20)  {
                Button {
                    let url = URL(string: "itms-apps://itunes.apple.com/app/1487580623")
                    UIApplication.shared.open(url!)
                } label: {
                    VStack(spacing: 20) {
                        HStack {
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.leadinghalf.fill")
                        }.foregroundColor(.orange)
                        Text("Leave a Review")
                            .font(.headline)
                            .lineLimit(nil)
                        Text("A review helps other people find the app and let's Maegan know if they are working in the right direction.")
                            .lineLimit(nil)
                    }
                    VStack(spacing: 20)  {
                        Image(systemName: "cup.and.saucer")
                        Text("Buy Maegan a Coffee")
                            .font(.headline)
                            .lineLimit(nil)
                        Text("Support an solo developer")
                            .lineLimit(nil)
                    }
                }

            }
        }.navigationTitle(Text("v\(appVersion) (\(appBuild))"))
            .navigationBarTitleDisplayMode(.large)
    }
}
