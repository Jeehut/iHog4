//
//  NewShowView.swift
//  iHog
//
//  Created by Maegan Wilson on 10/16/20.
//

import SwiftUI

struct NewShowView: View {
    @State private var showName: String = "New Show"
    var body: some View {
        Form{
            HStack{
                Text("Show Name")
                TextField("Show Name", text: $showName)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.blue)
            }
            HStack{
                Button(action: {
                    print("Cancel")
                }){
                    Text("Cancel")
                        .foregroundColor(.red)
                }
                Spacer()
                Button(action: {
                    print("Save in CoreData and close window")
                }){
                    Text("Save")
                        .foregroundColor(.green)
                }
            }
        }.frame(maxHeight: 150, alignment: .center)
    }
}

struct NewShowView_Previews: PreviewProvider {
    static var previews: some View {
        NewShowView()
    }
}
