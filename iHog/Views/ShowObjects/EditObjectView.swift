//
//  EditObjectView.swift
//  iHog
//
//  Created by Maegan Wilson on 11/21/20.
//

import SwiftUI

struct EditObjectView: View {
    var obj: ShowObject
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct EditObjectView_Previews: PreviewProvider {
    static var previews: some View {
        EditObjectView(obj: testShowObjects[0])
    }
}
