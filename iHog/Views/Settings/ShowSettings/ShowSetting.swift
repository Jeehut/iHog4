//
//  ShowSetting.swift
//  iHog
//
//  Created by Maegan Wilson on 9/18/20.
//

import SwiftUI

struct ShowSetting: View {
    var body: some View {
        Form{
            ObjectSettings(objectName: "group")
            ObjectSettings(objectName: "palette")
            ObjectSettings(objectName: "list")
            ObjectSettings(objectName: "scene")
            Button("Save All") {
                print("save settings")
            }.foregroundColor(.green)
        }
    }
}

struct ShowSetting_Previews: PreviewProvider {
    static var previews: some View {
        ShowSetting()
        
    }
}
