//
//  Settings.swift
//  iHog
//
//  Created by Maegan Wilson on 9/16/20.
//

import SwiftUI
import CoreData

struct SettingsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var osc: OSCHelper
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ShowEntity.dateLastModified, ascending: true)],
        animation: .default)
    private var shows: FetchedResults<ShowEntity>
    
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
        case tipJar
        case oscLogView
    }
    
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    let appBuild = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    
    
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    // MARK: SHOW NAV
                    Section(header: Text("Shows")) {
                        ForEach(shows) { show in
                            NavigationLink(show.name!, destination: ShowNavigation(selectedShow: show))
                        }.onDelete(perform: delete)
                        Button(action: {
                            isAddingShow = true
                        }){
                            Text("Add Show")
                        }.foregroundColor(.blue)
                    }
                    // MARK: HARDWARE
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
                    // MARK: SETTINGS
                    Section(header: Text("Settings")){
                        NavigationLink("Device", destination: Device(), tag: SettingsNav.device, selection: $selectedSetting)
                        NavigationLink("Show Settings", destination: ShowSetting(), tag: SettingsNav.showSettings, selection: $selectedSetting)
                        NavigationLink("OSC Log", destination: OSCLogView(), tag: SettingsNav.oscLogView, selection: $selectedSetting)
                    }
                    // MARK: ABOUT
                    Section(header: Text("About"),
                            footer: Text("App Version: \(appVersion ?? "N/A") (\(appBuild ?? "N/A"))")){
                        Link("ℹ️ About [iHog Website]", destination: URL(string: "https://ihogapp.com/about")!)
                        Link("📘 Guide [iHog Website]", destination: URL(string: "https://ihogapp.com/guide")!)
                        Link("🐛 Report a bug [GitHub Account Required]", destination: URL(string: "https://github.com/maeganwilson/iHog4/issues/new?assignees=maeganwilson&labels=question&template=bug_report.md&title=%5BBUG%5D")!)
                        Link("💡 Request a feature [GitHub Account Required]", destination: URL(string: "https://github.com/maeganwilson/iHog4/issues/new?assignees=maeganwilson&labels=question&template=feature_request.md&title=%5BREQUEST%5D")!)
                        Link("💬 Chat about iHog [Dev's discord link]", destination: URL(string: "https://discord.gg/HmGYbNHmun")!)
                        NavigationLink(
                            "Tip Jar",
                            destination: TipJarView(),
                            tag: SettingsNav.tipJar,
                            selection: $selectedSetting)
                    }
                }
                .listStyle( SidebarListStyle())
                .blur(radius: isAddingShow ? 2.5 : 0.0)
                if isAddingShow{
                    NewShowView(isShowing: $isAddingShow)
                        .cornerRadius(BASE_CORNER_RADIUS)
                        .shadow(radius: DOUBLE_CORNER_RADIUS)
                        .animation(.spring())
                }
            }
        }.navigationViewStyle( DoubleColumnNavigationViewStyle())
    }
    
    
    func delete(at offsets: IndexSet) {
        let indexOfShow: Int = offsets.first ?? 0
        
        let showID: NSUUID = shows[indexOfShow].id! as NSUUID
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ShowEntity")
        fetchRequest.predicate = NSPredicate(format: "id == %@", showID as CVarArg)
        fetchRequest.fetchLimit = 1
        do{
            let test = try viewContext.fetch(fetchRequest)
            let showToDelete = test[0] as! NSManagedObject
            viewContext.delete(showToDelete)
            try viewContext.save()
        } catch{
            print(error)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
