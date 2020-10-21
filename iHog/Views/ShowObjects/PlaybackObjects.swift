//
//  PlaybackObjects.swift
//  iHog
//
//  Created by Maegan Wilson on 9/23/20.
//

import SwiftUI
import CoreData

struct PlaybackObjects: View {
    @AppStorage(Settings.chosenShowID) var chosenShowID: String = ""
    @Environment(\.managedObjectContext) private var viewContext
    @State private var listObjects: [ShowObject] = []
    @State private var sceneObjects: [ShowObject] = []
    
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
        .onAppear{
            getAllObjects()
        }
    }
    
    func addList(){
        let newList = ShowObject(
            id: UUID(),
            objType: .list,
            number: Double(listObjects.count+1),
            objColor: "gray",
            isOutlined: true)
        
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
    
    func addScene(){
        let newScene = ShowObject(
            id: UUID(),
            objType: .scene,
            number: Double(sceneObjects.count+1),
            objColor: "yellow",
            isOutlined: true)
        
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
    
    func releaseAll(){
        print("Release all")
    }
    
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

struct PlaybackObjects_Previews: PreviewProvider {
    static var previews: some View {
        PlaybackObjects()
    }
}
