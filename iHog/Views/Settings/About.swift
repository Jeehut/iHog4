//
//  About.swift
//  iHog
//
//  Created by Maegan Wilson on 2/20/21.
//

import SwiftUI

struct About: View {
    @Binding var selectedSetting: SettingsNav?
    var totalTipped: Double
    
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    let appBuild = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    
    var body: some View {
        Section(header: Text("About"),
                footer: Text("App Version: \(appVersion ?? "N/A") (\(appBuild ?? "N/A"))")){
            Link("\(Image(systemName: "info.circle")) About [iHog Website]", destination: URL(string: "https://ihogapp.com/about")!)
            Link("\(Image(systemName: "ant")) Report a bug [GitHub Account Required]", destination: URL(string: "https://github.com/maeganwilson/iHog4/issues/new?assignees=maeganwilson&labels=question&template=bug_report.md&title=%5BBUG%5D")!)
            Link("\(Image(systemName: "lightbulb")) Request a feature [GitHub Account Required]", destination: URL(string: "https://github.com/maeganwilson/iHog4/issues/new?assignees=maeganwilson&labels=question&template=feature_request.md&title=%5BREQUEST%5D")!)
            NavigationLink(
                "\(Image(systemName: "dollarsign.circle")) Tip Jar (\(SettingsView.priceFormatter.string(from: NSNumber(value: totalTipped)) ?? "NONE"))",
                destination: TipJarView(),
                tag: SettingsNav.tipJar,
                selection: $selectedSetting)
//                        Link("📘 Guide [iHog Website]", destination: URL(string: "https://ihogapp.com/guide")!)
            Link("\(Image(systemName: "bubble.left")) Chat about iHog [Dev's discord link]", destination: URL(string: "https://discord.gg/HmGYbNHmun")!)
        }
    }
}

//struct About_Previews: PreviewProvider {
//    static var previews: some View {
//        About()
//    }
//}
