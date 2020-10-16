//
//  Settings.swift
//  iHog
//
//  Created by Maegan Wilson on 9/16/20.
//

import SwiftUI

struct Settings: View {
    @State var selectedSetting: SettingsNav? = SettingsNav.device
    @State private var isAddingShow: Bool = false
    
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
            ZStack{
                List{
                    Section(header: Text("Shows")) {
                        ForEach(testShows) { show in
                            NavigationLink(show.name, destination: ShowNavigation(selectedShow: show))
                        }
                        Button(action: {
                            isAddingShow = true
                        }){
                            Text("Add Show")
                        }
                    }
                    Section(header: Text("Front Panel")){
                        NavigationLink(
                            "Programming",
                            destination: FPProgrammer(),
                            tag: SettingsNav.programmerHardware,
                            selection: $selectedSetting)
                        NavigationLink(
                            "Playback",
                            destination: FPPlayback(),
                            tag: SettingsNav.playbackHardware,
                            selection: $selectedSetting)
                    }
                    Section(header: Text("Settings")){
                        NavigationLink("Device", destination: Device(), tag: SettingsNav.device, selection: $selectedSetting)
                        NavigationLink("Show Settings", destination: ShowSetting(), tag: SettingsNav.showSettings, selection: $selectedSetting)
                        NavigationLink("About", destination: Text("About the app options"), tag: SettingsNav.about, selection: $selectedSetting)
                    }
                    Text("App Version: \(appVersion ?? "N/A") (\(appBuild ?? "N/A"))")
                }.listStyle( SidebarListStyle())
                if isAddingShow{
                    NewShowView()
                        .cornerRadius(BASE_CORNER_RADIUS)
                        .shadow(radius: 10)
                }
            }
        }.navigationViewStyle( DoubleColumnNavigationViewStyle())
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
