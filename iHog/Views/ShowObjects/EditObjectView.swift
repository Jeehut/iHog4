//
//  EditObjectView.swift
//  iHog
//
//  Created by Maegan Wilson on 11/21/20.
//

import SwiftUI
import CoreData

struct EditObjectView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) private var presentationMode
    @Binding var allObjects: [ShowObject]
    
    var obj: ShowObject
    
    @State private var name = ""
    @State private var isOutlined = false
    @State private var objColor = 1
    @State private var indexOfOBJ = 0
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {self.presentationMode.wrappedValue.dismiss()}){
                    Text("Cancel")
                }
                .foregroundColor(.red)
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    saveValues()
                }) {
                    Text("Save")
                }
                .foregroundColor(.green)
                .padding(.horizontal)
            }.padding(.vertical)
            Form{
                TextField("Name", text: $name)
                Toggle("Is Outlined", isOn: $isOutlined)
                Picker("Color", selection: $objColor) {
                    ForEach(0..<OBJ_COLORS.count){
                        Text(OBJ_COLORS[$0].description.capitalized)
                    }
                }.pickerStyle(MenuPickerStyle())
            }
            ShowObjectView(allObjects: $allObjects,
                           obj: ShowObject(
                            objType: obj.objType,
                            number: obj.number,
                            name: name,
                            objColor: OBJ_COLORS[objColor].description,
                            isOutlined: isOutlined),
                           size: "medium")
        }.onAppear{
            getInitialValues()
        }
//        .onDisappear(perform: saveValues)
    }
    
    func getInitialValues() {
        print("Getting initial values")
        name = obj.getName()
        isOutlined = obj.isOutlined
        objColor = obj.getColor()
    }
    func saveValues(){
        let updatedOBJ = ShowObject(id: obj.id, objType: obj.objType, number: obj.number, name: name, objColor: OBJ_COLORS[objColor].description, isOutlined: isOutlined)
        let savedOBJID: NSUUID = obj.id as NSUUID
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ShowObjectEntity")
        fetchRequest.predicate = NSPredicate(format: "id == %@", savedOBJID as CVarArg)
        fetchRequest.fetchLimit = 1
        do {
            let test = try viewContext.fetch(fetchRequest)
            let objectToUpdate = test[0] as! NSManagedObject
            objectToUpdate.setValue(name, forKey: "name")
            objectToUpdate.setValue(OBJ_COLORS[objColor].description, forKey: "objColor")
            objectToUpdate.setValue(isOutlined, forKey: "isOutlined")
            try viewContext.save()
            allObjects.removeAll{$0 == obj}
            allObjects.append(updatedOBJ)
            allObjects.sort(by: {$0.number  < $1.number})
        } catch {
            print(error)
        }
        
    }
}

//struct EditObjectView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditObjectView(obj: testShowObjects[0])
//    }
//}
