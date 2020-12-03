//
//  PlaybackObjects.swift
//  iHog
//
//  Created by Maegan Wilson on 9/23/20.
//

import SwiftUI
import CoreData

struct PlaybackObjects: View {
    @AppStorage(Settings.chosenShowID.rawValue) var chosenShowID: String = ""
    // MARK: LIST Default Values
    @AppStorage(Settings.buttonColorList.rawValue) var buttonColorList = 0
    @AppStorage(Settings.buttonSizeList.rawValue) var buttonSizeList = 0
    @AppStorage(Settings.buttonsAcrossList.rawValue) var buttonsAcrossList = 3
    @AppStorage(Settings.isButtonFilledList.rawValue) var buttonFilledList = false
    // MARK: SCENE Default Values
    @AppStorage(Settings.buttonColorScene.rawValue) var buttonColorScene = 0
    @AppStorage(Settings.buttonSizeScene.rawValue) var buttonSizeScene = 0
    @AppStorage(Settings.buttonsAcrossScene.rawValue) var buttonsAcrossScene = 3
    @AppStorage(Settings.isButtonFilledScene.rawValue) var buttonFilledScene = false
    
    @Environment(\.managedObjectContext) private var viewContext
    @State private var listObjects: [ShowObject] = []
    @State private var sceneObjects: [ShowObject] = []
    
    // Size selections
    let sizes: [String] = ["small", "medium", "large", "extra large"]
    
    var body: some View {
        VStack{
            // MARK: Toolbar
            HStack{
                Button(action: addList) {
                    VStack{
                        Image(systemName: "plus.rectangle")
                        Text("Add List")
                    }
                }
                Spacer()
                Button(action: releaseAll){
                    VStack{
                        Image(systemName: "xmark.square")
                        Text("Release All")
                    }
                }.foregroundColor(.red)
                Spacer()
                Button(action: addScene) {
                    VStack{
                        Image(systemName: "plus.rectangle")
                        Text("Add Scene")
                    }
                }
            }
            Text("Lists")
                .font(.title)
                .fontWeight(.black)
            // MARK: Lists
            ObjectGrid(size: sizes[buttonSizeList],
                       buttonsAcross: buttonsAcrossList,
                       objects: listObjects, allObjects: $listObjects)
            // MARK: Scenes
            Text("Scenes")
                .font(.title)
                .fontWeight(.black)
            ObjectGrid(size: sizes[buttonSizeScene],
                       buttonsAcross: buttonsAcrossScene,
                       objects: sceneObjects, allObjects: $sceneObjects)
        }.padding()
        .onAppear{
            getAllObjects()
        }
    }
    
    // MARK: add List
    func addList(){
        let newList = ShowObject(
            id: UUID(),
            objType: .list,
            number: Double(listObjects.count+1),
            objColor: OBJ_COLORS[buttonColorList].description,
            isOutlined: !buttonFilledList)
        
        listObjects.append(newList)
        
        let obj = ShowObjectEntity(context: viewContext)
        obj.id = newList.id
        obj.isOutlined = newList.isOutlined
        obj.name = newList.getName()
        obj.number = newList.number
        obj.objColor = newList.objColor
        obj.objType = newList.objType.rawValue
        obj.showID = chosenShowID
        
        do{
            print("Save")
            try viewContext.save()
        } catch {
            print("ERROR")
        }
    }
    
    // MARK: add Scene
    func addScene(){
        let newScene = ShowObject(
            id: UUID(),
            objType: .scene,
            number: Double(sceneObjects.count+1),
            objColor: OBJ_COLORS[buttonColorScene].description,
            isOutlined: !buttonFilledScene)
        
        sceneObjects.append(newScene)
        
        let obj = ShowObjectEntity(context: viewContext)
        obj.id = newScene.id
        obj.isOutlined = newScene.isOutlined
        obj.name = newScene.getName()
        obj.number = newScene.number
        obj.objColor = newScene.objColor
        obj.objType = newScene.objType.rawValue
        obj.showID = chosenShowID
        
        do{
            try viewContext.save()
        } catch {
            print("ERROR")
        }
    }
    
    // MARK: Release all function
    // TODO: Add OSC
    func releaseAll(){
        print("Release all")
    }
    
    // MARK: Get all objects
    func getAllObjects(){
        listObjects = []
        sceneObjects = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ShowObjectEntity")
        fetchRequest.predicate = NSPredicate(format: "showID == %@", chosenShowID)
        
        do {
            let results = try viewContext.fetch(fetchRequest) as! [ShowObjectEntity]
            for showObj in results{
                switch showObj.objType {
                case ShowObjectType.list.rawValue:
                    let newObj = ShowObject(
                        id: showObj.id!,
                        objType: .list,
                        number: showObj.number,
                        name: showObj.name,
                        objColor: showObj.objColor ?? "gray",
                        isOutlined: showObj.isOutlined
                    )
                    listObjects.append(newObj)
                case ShowObjectType.scene.rawValue:
                    let newObj = ShowObject(
                        id: showObj.id!,
                        objType: .scene,
                        number: showObj.number,
                        name: showObj.name,
                        objColor: showObj.objColor ?? "green",
                        isOutlined: showObj.isOutlined
                    )
                    sceneObjects.append(newObj)
                default:
                    continue
                }
            }
            listObjects.sort(by: {$0.number < $1.number})
            sceneObjects.sort(by: {$0.number < $1.number})
        } catch {
            print(error)
        }
    }
}

// MARK: PREVIEW
struct PlaybackObjects_Previews: PreviewProvider {
    static var previews: some View {
        PlaybackObjects()
    }
}
