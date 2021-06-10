//
//  ShowNavigation.swift
//  iHog
//
//  Created by Maegan Wilson on 10/15/20.
//

import SwiftUI

struct ShowNavigation: View {
    @AppStorage(Settings.chosenShowID.rawValue) var chosenShowID: String = ""
    @AppStorage(Settings.puntPageIsEnabled.rawValue) var puntPageIsEnabled: Bool = false
    var selectedShow: ShowEntity
    
    @StateObject var chosenShow = ChosenShow()
    
    @State private var selectedView: Views = Views.programmingObjects
    
    enum Views: Hashable {
        case programmingObjects
        case playbackObjects
        case puntPageProgramming
        case puntPagePlayback
        case puntPageProgPlay
    }
    var body: some View {
        TabView(selection: $selectedView) {
            ProgrammingObjects(show: chosenShow)
                .tabItem{
                    Image(systemName: "wand.and.rays")
                }
                .tag(Views.programmingObjects)
            PlaybackObjects(show: chosenShow)
                .tabItem{
                    Image(systemName: "play.rectangle")
                }
                .tag(Views.playbackObjects)
            if puntPageIsEnabled {
                PPPlayback(show: chosenShow)
                    .tabItem{
                        Image(systemName: "slider.horizontal.below.square.fill.and.square")
                    }
                    .tag(Views.puntPagePlayback)
                PPProgramPlayback(show: chosenShow)
                    .tabItem{
                        Image(systemName: "esim")
                    }
                    .tag(Views.puntPageProgPlay)
                PPProgramming(show: chosenShow)
                    .tabItem{
                        Image(systemName: "paintbrush")
                    }
                    .tag(Views.puntPageProgramming)
            } else {
                PPPurchaseView()
                    .tabItem{
                        Image(systemName: "slider.horizontal.below.square.fill.and.square")
                        Text("Punt Page Unlock")
                    }
                    .tag(Views.puntPagePlayback)
            }
        }
        .navigationBarTitle(selectedShow.name!)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            chosenShowID = selectedShow.id!.uuidString
        }
    }
}

//struct ShowNavigation_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowNavigation(selectedShow: testShows[2])
//    }
//}
