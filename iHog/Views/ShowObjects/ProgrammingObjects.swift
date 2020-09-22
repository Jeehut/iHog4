//
//  ProgrammingObjects.swift
//  iHog
//
//  Created by Maegan Wilson on 9/18/20.
//

import SwiftUI

struct ProgrammingObjects: View {
    @State private var chosenPaletteType: Int = 0
    var groupObjects: [ShowObject]
    var paletteObjects: [ShowObject]
    let paletteTypes: [ShowObjectType] = [.intensity, .position, .color, .beam, .effect]
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    print("Add group")
                }, label: {
                    VStack{
                        Image(systemName: "plus.rectangle")
                        Text("Add Group")
                    }
                })
                Spacer()
                Button(action: {
                    print("Clear")
                }, label: {
                    VStack{
                        Image(systemName: "xmark.square")
                        Text("CLEAR")
                    }
                }).foregroundColor(.red)
                Spacer()
                Button(action: {
                    print("Add palette")
                }, label: {
                    VStack{
                        Image(systemName: "plus.rectangle")
                        Text("Add \(paletteTypes[chosenPaletteType].rawValue.localizedCapitalized) Palette")
                    }
                })
            }
            // MARK: Groups
            ObjectGrid(
                size: "small",
                buttonsAcross: 5,
                objects: groupObjects
            ).padding()
            // MARK: Pallets
            Picker("palette selection", selection: $chosenPaletteType) {
                ForEach(0 ..< paletteTypes.count) {
                    Text(paletteTypes[$0].rawValue.capitalized)
                }
            }.pickerStyle(SegmentedPickerStyle())
            ObjectGrid(
                size: "small",
                buttonsAcross: 5,
                objects: paletteObjects
            )
            Spacer()
        }.padding()
    }
}

struct ProgrammingObjects_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammingObjects(
            groupObjects: testShowObjects,
            paletteObjects: testShowObjects
        )
    }
}
