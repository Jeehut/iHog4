//
//  Settings.swift
//  iHog
//
//  Created by Maegan Wilson on 9/16/20.
//

import SwiftUI

struct Settings: View {
    @State var selectedSetting: SettingsNav? = .chooseShow
    
    enum SettingsNav:Hashable {
        case chooseShow
        case device
        case showSettings
        case about
        case programmerHardware
        case playbackHardware
        case playbackObject
        case programObject
        case custom
    }
    
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    let appBuild = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    
    
    var body: some View {
        NavigationView{
            List{
                NavigationLink("Show", destination: SelectShow(), tag: SettingsNav.chooseShow, selection: $selectedSetting)
                NavigationLink(
                    "Programming",
                    destination: FPProgrammer(),
                    tag: SettingsNav.programmerHardware,
                    selection: $selectedSetting)
                NavigationLink(
                    "Playback",
                    destination: Text("Playback Hardware"),
                    tag: SettingsNav.playbackHardware,
                    selection: $selectedSetting)
                NavigationLink(
                    "Lists & Scenes",
                    destination: PlaybackObjects(listObjects: testShowObjects, sceneObjects: testShowObjects),
                    tag: SettingsNav.playbackObject,
                    selection: $selectedSetting)
                NavigationLink(
                    "Groups & Palettes",
                    destination: ProgrammingObjects(groupObjects: testShowObjects, paletteObjects: testShowObjects),
                    tag: SettingsNav.programObject,
                    selection: $selectedSetting)
                Section(header: Text("Settings"), footer:
                            Text("App Version: \(appVersion ?? "N/A") (\(appBuild ?? "N/A"))")){
                    NavigationLink("Device", destination: Device(), tag: SettingsNav.device, selection: $selectedSetting)
                    NavigationLink("Show Settings", destination: ShowSetting(), tag: SettingsNav.showSettings, selection: $selectedSetting)
                    NavigationLink("About", destination: Text("About the app options"), tag: SettingsNav.about, selection: $selectedSetting)
                }
            }.listStyle(GroupedListStyle())
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
