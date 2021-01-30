//
//  ProgrammingObjects.swift
//  iHog
//
//  Created by Maegan Wilson on 9/18/20.
//

import SwiftUI
import CoreData

struct ProgrammingObjects: View {
    // MARK: Default values
    @AppStorage(Settings.chosenShowID.rawValue) var chosenShowID: String = ""
    
    // MARK: Palette defaults
    @AppStorage(Settings.buttonColorPalette.rawValue) var buttonColorPalette = 0
    @AppStorage(Settings.buttonSizePalette.rawValue) var buttonSizePalette = 0
    @AppStorage(Settings.buttonsAcrossPalette.rawValue) var buttonsAcrossPallete = 3
    @AppStorage(Settings.isButtonFilledPalette.rawValue) var isButtonFilledPalette = false
    
    // MARK: Group defaults
    @AppStorage(Settings.buttonColorGroup.rawValue) var buttonColorGroup = 0
    @AppStorage(Settings.buttonSizeGroup.rawValue) var buttonSizeGroup = 0
    @AppStorage(Settings.buttonsAcrossGroup.rawValue) var buttonsAcrossGroup = 3
    @AppStorage(Settings.isButtonFilledGroup.rawValue) var isButtonFilledGroup = false
    
    // MARK: Environment variables
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.managedObjectContext) private var viewContext
    
    // MARK: State
    @State private var chosenPaletteType: Int = 0
    @State private var groupObjects: [ShowObject] = []
    @State private var paletteObjects: [ShowObject] = []
    
    // MARK: Local constants
    let paletteTypes: [ShowObjectType] = [.intensity, .position, .color, .beam, .effect]
    let sizes: [String] = ["small", "medium", "large", "extra large"]
    
    fileprivate func returnStackView() -> some View {
        return Group{
            HStack{
                ObjectGrid(
                    size: sizes[buttonSizeGroup],
                    buttonsAcross: getMaxButtonSize()[0],
                    objects: groupObjects, allObjects: $groupObjects
                ).padding()
                
                // MARK: Pallets
                VStack{
                    Picker("palette selection", selection: $chosenPaletteType) {
                        ForEach(0 ..< paletteTypes.count) {
                            Text(paletteTypes[$0].rawValue.capitalized)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    ObjectGrid(
                        size: sizes[buttonSizePalette],
                        buttonsAcross: getMaxButtonSize()[1],
                        objects: paletteObjects.filter({ obj in
                            return obj.objType == paletteTypes[chosenPaletteType]
                        }), allObjects: $paletteObjects
                    )
                }
                
            }
        }
    }
    
    fileprivate func returnSideBySideView() -> some View {
        return Group{
            // MARK: Groups
            ObjectGrid(
                size: sizes[buttonSizeGroup],
                buttonsAcross: getMaxButtonSize()[0],
                objects: groupObjects, allObjects: $groupObjects
            ).padding()
            
            // MARK: Pallets
            Picker("palette selection", selection: $chosenPaletteType) {
                ForEach(0 ..< paletteTypes.count) {
                    Text(paletteTypes[$0].rawValue.capitalized)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            ObjectGrid(
                size: sizes[buttonSizePalette],
                buttonsAcross: getMaxButtonSize()[1],
                objects: paletteObjects.filter({ obj in
                    return obj.objType == paletteTypes[chosenPaletteType]
                }), allObjects: $paletteObjects
            )
        }
    }
    
    var body: some View {
        VStack{
            // MARK: Toolbar
            HStack{
                Button(action: addGroup){
                    VStack{
                        Image(systemName: "plus.rectangle")
                        Text("Add Group")
                    }
                }
                Spacer()
                Button(action: clear){
                    VStack{
                        Image(systemName: "xmark.square")
                        Text("CLEAR")
                    }
                }.foregroundColor(.red)
                Spacer()
                Button(action: addPalette){
                    VStack{
                        Image(systemName: "plus.rectangle")
                        Text("Add \(paletteTypes[chosenPaletteType].rawValue.localizedCapitalized)")
                    }
                }
            }
            
            if horizontalSizeClass == .compact {
                if verticalSizeClass == .compact {
                    returnStackView()
                } else {
                returnSideBySideView()
                }
            }
            else {
                returnStackView()
            }
        }.padding()
        .onAppear{
            getAllObjects()
            print(horizontalSizeClass.debugDescription)
        }
    }
    
    // MARK: Add Group
    func addGroup() {
        let newGroup = ShowObject(
            id: UUID(),
            objType: .group,
            number: (Double((groupObjects.count + 1))),
            objColor: OBJ_COLORS[buttonColorGroup].description,
            isOutlined: isButtonFilledGroup)
        groupObjects.append(newGroup)
        
        let obj = ShowObjectEntity(context: viewContext)
        obj.id = newGroup.id
        obj.isOutlined = newGroup.isOutlined
        obj.name = newGroup.getName()
        obj.number = newGroup.number
        obj.objColor = newGroup.objColor
        obj.objType = newGroup.objType.rawValue
        obj.showID = chosenShowID
        do{
            try viewContext.save()
        } catch{
            print("Error")
        }
    }
    
    // MARK: Add Palette
    func addPalette(){
        let newPalette = ShowObject(
            id: UUID(),
            objType: paletteTypes[chosenPaletteType],
            number: Double((
                            paletteObjects.filter({ obj in
                                                    return obj.objType == paletteTypes[chosenPaletteType]})
                                .count)
                            + 1
            ),
            objColor: OBJ_COLORS[buttonColorPalette].description,
            isOutlined: isButtonFilledPalette)
        paletteObjects.append(newPalette)
        
        let obj = ShowObjectEntity(context: viewContext)
        obj.id = newPalette.id
        obj.isOutlined = newPalette.isOutlined
        obj.name = newPalette.getName()
        obj.number = newPalette.number
        obj.objColor = newPalette.objColor
        obj.objType = newPalette.objType.rawValue
        obj.showID = chosenShowID
        do{
            try viewContext.save()
        } catch{
            print("Error")
        }
    }
    
    // TODO: Add OSC
    func clear(){
        print("Clear")
    }
    
    // MARK: Get all objects
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
    
    // Returns: Integer array of 2. First index is groups
    //          Second index is palettes
    func getMaxButtonSize() -> [Int]{
        switch horizontalSizeClass {
        case .compact:
            return [getGroupButtonsAcross(), getPaletteButtonsAcross()]
        default:
            return [getGroupButtonsAcross(), getPaletteButtonsAcross()]
        }
    }
    
    func getPaletteButtonsAcross() -> Int{
        switch buttonSizePalette {
        // small
        case 0:
            if buttonsAcrossPallete <= SMALL_MAX_BUTTONS_ACROSS {
                return buttonsAcrossPallete
            }
            return SMALL_MAX_BUTTONS_ACROSS
        // medium
        case 1:
            if buttonsAcrossPallete <= MEDIUM_MAX_BUTTONS_ACROSS {
                return buttonsAcrossPallete
            }
            return MEDIUM_MAX_BUTTONS_ACROSS
        // large
        case 2:
            return LARGE_MAX_BUTTONS_ACROSS
        // extra large
        default:
            return XL_MAX_BUTTONS_ACROSS
        }
    }
    
    func getGroupButtonsAcross() -> Int{
        switch buttonSizeGroup {
        // small
        case 0:
            if buttonsAcrossGroup <= SMALL_MAX_BUTTONS_ACROSS {
                return buttonsAcrossGroup
            }
            return SMALL_MAX_BUTTONS_ACROSS
        // medium
        case 1:
            if buttonsAcrossGroup <= MEDIUM_MAX_BUTTONS_ACROSS {
                return buttonsAcrossGroup
            }
            return MEDIUM_MAX_BUTTONS_ACROSS
        // large
        case 2:
            return LARGE_MAX_BUTTONS_ACROSS
        // extra large
        default:
            return XL_MAX_BUTTONS_ACROSS
        }
    }
}

struct ProgrammingObjects_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammingObjects()
    }
}
