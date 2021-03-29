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
    
    @FetchRequest(entity: TipEntity.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \TipEntity.dateTipped, ascending: true)]) private var tips: FetchedResults<TipEntity>
    
    @State var selectedSetting: SettingsNav? = SettingsNav.device
    @State private var isAddingShow: Bool = false
    @State private var totalTipped: Double = 0.0
    
    static let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        
        formatter.formatterBehavior = .behavior10_4
        formatter.numberStyle = .currency
        
        return formatter
    }()
    
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
                        Link("🐛 Report a bug [GitHub Account Required]", destination: URL(string: "https://github.com/maeganwilson/iHog4/issues/new?assignees=maeganwilson&labels=question&template=bug_report.md&title=%5BBUG%5D")!)
                        Link("💡 Request a feature [GitHub Account Required]", destination: URL(string: "https://github.com/maeganwilson/iHog4/issues/new?assignees=maeganwilson&labels=question&template=feature_request.md&title=%5BREQUEST%5D")!)
                        NavigationLink(
                            "💰 Tip Jar (\(SettingsView.priceFormatter.string(from: NSNumber(value: totalTipped)) ?? "NONE"))",
                            destination: TipJarView(),
                            tag: SettingsNav.tipJar,
                            selection: $selectedSetting)
                        Link("📘 Guide [iHog Website]", destination: URL(string: "https://ihogapp.com/guide")!)
                        Link("💬 Chat about iHog [Dev's discord link]", destination: URL(string: "https://discord.gg/HmGYbNHmun")!)
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
        .onAppear {
            getTotalTipped()
        }
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
    func getTotalTipped() {
        var total = 0.0
        for tip in tips {
            total += tip.amount
        }
        
        totalTipped = total
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
