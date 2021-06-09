//
//  ChosenShow.swift
//  iHog
//
//  Created by Maegan Wilson on 6/9/21.
//

import Foundation

class ChosenShow: ObservableObject {
    private var id: UUID
    
    @Published var scenes: [ShowObject]
    @Published var lists: [ShowObject]
    @Published var groups: [ShowObject]
    @Published var palettes: [ShowObject]
    
    init(showID: UUID){
        id = showID
        scenes = []
        lists = []
        groups = []
        palettes = []
    }
    
    // MARK: Scenes
    func addScene(_ obj: ShowObject) {
        scenes.append(obj)
    }
    
    func updateScene(_ obj: ShowObject) {
        let index = scenes.firstIndex{ $0.id == obj.id }
        if index != nil {
            scenes[index!].setName(obj.getName())
            scenes[index!].setNumber(obj.number)
            scenes[index!].setColor(obj.getColorString())
        } else {
            print("UPDATE SHOULD NOT HAVE BEEN CALLED")
        }
    }
    
    func removeScene(_ obj: ShowObject) {
        scenes.removeAll{ $0.id == obj.id }
    }
    // MARK: Lists
    func addList(_ obj: ShowObject) {
        lists.append(obj)
    }
    
    func updateList(_ obj: ShowObject) {
        let index = lists.firstIndex{ $0.id == obj.id }
        if index != nil {
            lists[index!].setName(obj.getName())
            lists[index!].setNumber(obj.number)
            lists[index!].setColor(obj.getColorString())
        } else {
            print("UPDATE SHOULD NOT HAVE BEEN CALLED")
        }
    }
    
    func removeList(_ obj: ShowObject) {
        lists.removeAll{ $0.id == obj.id }
    }
    
    // MARK: Groups
    func addGroup(_ obj: ShowObject) {
        groups.append(obj)
    }
    
    func updateGroup(_ obj: ShowObject) {
        let index = groups.firstIndex{ $0.id == obj.id }
        if index != nil {
            groups[index!].setName(obj.getName())
            groups[index!].setNumber(obj.number)
            groups[index!].setColor(obj.getColorString())
        } else {
            print("UPDATE SHOULD NOT HAVE BEEN CALLED")
        }
    }
    
    func removeGroup(_ obj: ShowObject) {
        groups.removeAll{ $0.id == obj.id }
    }
    
    // MARK: Palettes
    func addPalette(_ obj: ShowObject) {
        palettes.append(obj)
    }
    
    func updatePalette(_ obj: ShowObject) {
        let index = palettes.firstIndex{ $0.id == obj.id }
        if index != nil {
            palettes[index!].setName(obj.getName())
            palettes[index!].setNumber(obj.number)
            palettes[index!].setColor(obj.getColorString())
        } else {
            print("UPDATE SHOULD NOT HAVE BEEN CALLED")
        }
    }
    
    func removePalette(_ obj: ShowObject) {
        palettes.removeAll{ $0.id == obj.id }
    }
}
