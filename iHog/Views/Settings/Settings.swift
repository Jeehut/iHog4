//
//  Settings.swift
//  iHog
//
//  Created by Maegan Wilson on 9/16/20.
//

import SwiftUI

struct Settings: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State var selectedSetting: SettingsNav? = .chooseShow
    
    enum SettingsNav:Hashable {
        case chooseShow
        case device
        case showSettings
        case about
    }
    
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    let appBuild = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    
    
    var body: some View {
        NavigationView{
            List{
                NavigationLink("Show", destination: SelectShow(), tag: SettingsNav.chooseShow, selection: $selectedSetting)
                NavigationLink("Device", destination: Device(), tag: SettingsNav.device, selection: $selectedSetting)
                NavigationLink("Show Settings", destination: Text("Adjust show"), tag: SettingsNav.showSettings, selection: $selectedSetting)
                NavigationLink("About", destination: Text("About the app options"), tag: SettingsNav.about, selection: $selectedSetting)
                Text("App Version: \(appVersion ?? "N/A") (\(appBuild ?? "N/A"))")
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
