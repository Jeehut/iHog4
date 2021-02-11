//
//  PPProgramming.swift
//  iHog
//
//  Created by Maegan Wilson on 2/9/21.
//

import SwiftUI
import CoreData

struct PPProgramming: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @AppStorage(Settings.chosenShowID.rawValue) var chosenShowID: String = ""
    
    @State private var groupObjects: [ShowObject] = []
    @State private var paletteObjects: [ShowObject] = []
    
    @State private var numericKeypadIsShowing = false
    
    @State private var chosenPaletteType = 0
    let paletteTypes: [ShowObjectType] = [.intensity, .position, .color, .beam, .effect]
    
    var body: some View {
        if horizontalSizeClass == .regular {
            if verticalSizeClass == .regular {
                HStack{
                    CompRegFPprogramming()
                        .padding(.all)
                    VStack{
                        ObjectGrid(size: "small",
                                   buttonsAcross: 3,
                                   objects: groupObjects,
                                   allObjects: $groupObjects)
                        Picker("palette selection", selection: $chosenPaletteType) {
                            ForEach(0 ..< paletteTypes.count) {
                                Text(paletteTypes[$0].rawValue.capitalized)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                        ObjectGrid(
                            size: "small",
                            buttonsAcross: 3,
                            objects: paletteObjects.filter({ obj in
                                return obj.objType == paletteTypes[chosenPaletteType]
                            }), allObjects: $paletteObjects
                        )
                        
                    }.onAppear{
                        getAllObjects()
                    }
                }
            } else {
                HStack{
                    VStack{
                        OpenPartsView()
                    }
                    VStack{
                        SelectButtonView()
                        HBCButtonView()
                        ActionButtonView()
                    }
                    VStack{
                        ObjectGrid(size: "small",
                                   buttonsAcross: 3,
                                   objects: groupObjects,
                                   allObjects: $groupObjects)
                        Picker("palette selection", selection: $chosenPaletteType) {
                            ForEach(0 ..< paletteTypes.count) {
                                Text(paletteTypes[$0].rawValue.capitalized)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                        ObjectGrid(
                            size: "small",
                            buttonsAcross: 3,
                            objects: paletteObjects.filter({ obj in
                                return obj.objType == paletteTypes[chosenPaletteType]
                            }), allObjects: $paletteObjects
                        )
                        
                    }
                }
            }
        } else {
            VStack{
                ScrollView{
                    HStack{
                        Spacer().frame(height: 0)
                    }.onAppear{
                        getAllObjects()
                    }
                    HBCButtonView()
                    SelectButtonView()
                        .padding(.vertical)
                    OpenPartsView()
                }
                .padding(.all)
                Button(action: {
                    withAnimation{
                        numericKeypadIsShowing.toggle()
                    }
                }) {
                    Text("\(numericKeypadIsShowing ? "Hide" : "Show") Numeric Keypad")
                }
                .buttonStyle(OpenButtonStyle())
                if numericKeypadIsShowing {
                    NumericKeypadView()
                } else {
                    VStack{
                        ObjectGrid(size: "small",
                                   buttonsAcross: 3,
                                   objects: groupObjects,
                                   allObjects: $groupObjects)
                        Picker("palette selection", selection: $chosenPaletteType) {
                            ForEach(0 ..< paletteTypes.count) {
                                Text(paletteTypes[$0].rawValue.capitalized)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                        ObjectGrid(
                            size: "small",
                            buttonsAcross: 3,
                            objects: paletteObjects.filter({ obj in
                                return obj.objType == paletteTypes[chosenPaletteType]
                            }), allObjects: $paletteObjects
                        )
                        
                    }
                }
            }
        }
    }
    func getAllObjects(){
        groupObjects = []
        paletteObjects = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ShowObjectEntity")
        fetchRequest.predicate = NSPredicate(format: "showID == %@", chosenShowID)
        
        do {
            let results = try viewContext.fetch(fetchRequest) as! [ShowObjectEntity]
            for showObj in results{
                switch showObj.objType {
                case ShowObjectType.group.rawValue:
                    let newObj = ShowObject(
                        id: showObj.id!,
                        objType: .group,
                        number: showObj.number,
                        name: showObj.name,
                        objColor: showObj.objColor ?? "red",
                        isOutlined: showObj.isOutlined
                    )
                    groupObjects.append(newObj)
                case ShowObjectType.intensity.rawValue:
                    let newObj = ShowObject(
                        id: showObj.id!,
                        objType: .intensity,
                        number: showObj.number,
                        name: showObj.name,
                        objColor: showObj.objColor ?? "blue",
                        isOutlined: showObj.isOutlined
                    )
                    paletteObjects.append(newObj)
                case ShowObjectType.position.rawValue:
                    let newObj = ShowObject(
                        id: showObj.id!,
                        objType: .position,
                        number: showObj.number,
                        name: showObj.name,
                        objColor: showObj.objColor ?? "blue",
                        isOutlined: showObj.isOutlined
                    )
                    paletteObjects.append(newObj)
                case ShowObjectType.color.rawValue:
                    let newObj = ShowObject(
                        id: showObj.id!,
                        objType: .color,
                        number: showObj.number,
                        name: showObj.name,
                        objColor: showObj.objColor ?? "blue",
                        isOutlined: showObj.isOutlined
                    )
                    paletteObjects.append(newObj)
                case ShowObjectType.beam.rawValue:
                    let newObj = ShowObject(
                        id: showObj.id!,
                        objType: .beam,
                        number: showObj.number,
                        name: showObj.name,
                        objColor: showObj.objColor ?? "blue",
                        isOutlined: showObj.isOutlined
                    )
                    paletteObjects.append(newObj)
                case ShowObjectType.effect.rawValue:
                    let newObj = ShowObject(
                        id: showObj.id!,
                        objType: .effect,
                        number: showObj.number,
                        name: showObj.name,
                        objColor: showObj.objColor ?? "blue",
                        isOutlined: showObj.isOutlined
                    )
                    paletteObjects.append(newObj)
                default:
                    continue
                }
            }
            groupObjects.sort(by: {$0.number < $1.number})
            paletteObjects.sort(by: {$0.number < $1.number})
        } catch {
            print(error)
        }
    }
}

struct PPProgramming_Previews: PreviewProvider {
    static var previews: some View {
        PPProgramming().environmentObject(OSCHelper())
    }
}
