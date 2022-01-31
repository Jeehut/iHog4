//
//  About.swift
//  iHog
//
//  Created by Maegan Wilson on 2/20/21.
//

import SwiftUI

struct About: View {
    @Binding var selectedSetting: SettingsNav?
    @Binding var issueSubmitted: Bool?
    
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    let appBuild = Bundle.main.infoDictionary?["CFBundleVersion"] as? String

    @State private var tip = ""
    
    var body: some View {
        Section(header: Text("About"),
                footer: Text("App Version: \(appVersion ?? "N/A") (\(appBuild ?? "N/A"))")){
            Link("\(Image(systemName: "info.circle")) About [iHog Website]", destination: URL(string: "https://ihogapp.com/about")!)
            NavigationLink("\(Image(systemName: "note.text.badge.plus")) Send Feedback",
                           destination: UserFeedbackView(selection: $selectedSetting,
                                                         issueSubmitted: $issueSubmitted),
                           tag: SettingsNav.userFeedbackView,
                           selection: $selectedSetting)
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
