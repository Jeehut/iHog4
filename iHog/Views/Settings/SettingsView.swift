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
    }
    
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    let appBuild = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    
    
    var body: some View {
        NavigationView{
            ZStack{
                List{
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
