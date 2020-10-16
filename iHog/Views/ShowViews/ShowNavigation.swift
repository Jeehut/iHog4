//
//  ShowNavigation.swift
//  iHog
//
//  Created by Maegan Wilson on 10/15/20.
//

import SwiftUI

struct ShowNavigation: View {
    var selectedShow: Show
    @State private var selectedView: Views = Views.programmingObjects
    
    enum Views: Hashable {
        case programmingObjects
        case playbackObjects
        case puntPage
    }
    var body: some View {
        TabView(selection: $selectedView) {
            ProgrammingObjects(groupObjects: testShowObjects, paletteObjects: testShowObjects)
                .tabItem{
                    Image(systemName: "square.grid.2x2")
                }
                .tag(Views.programmingObjects)
            PlaybackObjects(listObjects: testShowObjects, sceneObjects: testShowObjects)
                .tabItem{
                    Image(systemName: "square.grid.3x2")
                }
                .tag(Views.programmingObjects)
        }
        .navigationBarTitle(selectedShow.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ShowNavigation_Previews: PreviewProvider {
    static var previews: some View {
        ShowNavigation(selectedShow: testShows[2])
    }
}
