//
//  PlaybackObjects.swift
//  iHog
//
//  Created by Maegan Wilson on 9/23/20.
//

import SwiftUI

struct PlaybackObjects: View {
    var listObjects: [ShowObject]
    var sceneObjects: [ShowObject]
    
    var body: some View {
        VStack{
            // MARK: Toolbar
            HStack{
                Button(action: {
                    print("Add list")
                }, label: {
                    VStack{
                        Image(systemName: "plus.rectangle")
                        Text("Add List")
                    }
                })
                Spacer()
                Button(action: {
                    print("Add list")
                }, label: {
                    VStack{
                        Image(systemName: "xmark.square")
                        Text("Release All")
                    }
                }).foregroundColor(.red)
                Spacer()
                Button(action: {
                    print("Add list")
                }, label: {
                    VStack{
                        Image(systemName: "plus.rectangle")
                        Text("Add Scene")
                    }
                })
            }
            Text("Lists")
                .font(.largeTitle)
                .fontWeight(.black)
            // MARK: Lists
            ObjectGrid(size: "medium",
                       buttonsAcross: 3,
                       objects: listObjects)
            // MARK: Scenes
            Text("Scenes")
                .font(.largeTitle)
                .fontWeight(.black)
            ObjectGrid(size: "medium",
                       buttonsAcross: 1,
                       objects: sceneObjects)
        }.padding()
    }
}

struct PlaybackObjects_Previews: PreviewProvider {
    static var previews: some View {
        PlaybackObjects(
            listObjects: testShowObjects,
            sceneObjects: testShowObjects)
    }
}
