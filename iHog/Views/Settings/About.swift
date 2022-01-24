//
//  About.swift
//  iHog
//
//  Created by Maegan Wilson on 2/20/21.
//

import SwiftUI

struct About: View {
    @AppStorage(Settings.build.rawValue) var buildNumber = 125
    @AppStorage(Settings.version.rawValue) var version = 2022.1

    @Binding var selectedSetting: SettingsNav?
    
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    let appBuild = Bundle.main.infoDictionary?["CFBundleVersion"] as? String

    @State private var tip = ""
    
    var body: some View {
        Section(header: Text("About"),
                footer: Text("App Version: \(appVersion ?? "N/A") (\(appBuild ?? "N/A"))")){
            NavigationLink("\(Image(systemName: "note.text")) Release Notes", destination: NewVersionView(selectedSetting: $selectedSetting))
                .tag(SettingsNav.versionView)
            Link("\(Image(systemName: "info.circle")) About [iHog Website]", destination: URL(string: "https://ihogapp.com/about")!)
            Link("\(Image(systemName: "ant")) Report a bug [GitHub Account Required]", destination: URL(string: "https://github.com/maeganwilson/iHog4/issues/new?assignees=maeganwilson&labels=question&template=bug_report.md&title=%5BBUG%5D")!)
            Link("\(Image(systemName: "lightbulb")) Request a feature [GitHub Account Required]", destination: URL(string: "https://github.com/maeganwilson/iHog4/issues/new?assignees=maeganwilson&labels=question&template=feature_request.md&title=%5BREQUEST%5D")!)
            NavigationLink(
                "\(Image(systemName: "dollarsign.circle")) Tip Jar (\(tip))",
                destination: TipJarView(),
                tag: SettingsNav.tipJar,
                selection: $selectedSetting)
//                        Link("📘 Guide [iHog Website]", destination: URL(string: "https://ihogapp.com/guide")!)
            Link("\(Image(systemName: "bubble.left")) Chat about iHog [Dev's discord link]", destination: URL(string: "https://discord.gg/HmGYbNHmun")!)
        }.onAppear {
            tip = TippingProducts().getTotalTipped()
        }
    }
}

//struct About_Previews: PreviewProvider {
//    static var previews: some View {
//        About()
//    }
//}
