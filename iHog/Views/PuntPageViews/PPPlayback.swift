//
//  PPPlayback.swift
//  iHog
//
//  Created by Maegan Wilson on 2/4/21.
//

import SwiftUI
import CoreData

struct PPPlayback: View {
    @Environment(\.managedObjectContext) private var viewContext
    @AppStorage(Settings.chosenShowID.rawValue) var chosenShowID: String = ""
    @State private var allPlaybackObjects: [ShowObject] = []
    
    var body: some View {
        HStack{
            CompPlayback()
            ObjectGrid(size: "medium",
                       buttonsAcross: 3,
                       objects: allPlaybackObjects,
                       allObjects: $allPlaybackObjects)
        }.onAppear{
            getAllObjects()
        }
    }
    
    func getAllObjects(){
        var listObjects: [ShowObject] = []
        var sceneObjects: [ShowObject] = []
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
            allPlaybackObjects = listObjects + sceneObjects
        } catch {
            print(error)
        }
    }
}
struct PPPlayback_Previews: PreviewProvider {
    static var previews: some View {
        PPPlayback()
    }
}
