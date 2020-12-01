//
//  EditObjectView.swift
//  iHog
//
//  Created by Maegan Wilson on 11/21/20.
//

import SwiftUI

struct EditObjectView: View {
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
                Spacer()
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Close")
                }
                .foregroundColor(.red)
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
    }
    
    func getInitialValues() {
        print("Getting initial values")
        name = obj.getName()
        isOutlined = obj.isOutlined
        objColor = obj.getColor()
    }
    func saveValues(){
        print("SAVE VALUES")
    }
}

//struct EditObjectView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditObjectView(obj: testShowObjects[0])
//    }
//}
