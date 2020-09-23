//
//  ObjectGrid.swift
//  iHog
//
//  Created by Maegan Wilson on 9/21/20.
//

import SwiftUI

struct ObjectGrid: View {
    var size: String
    var buttonsAcross: Int
    var objects: [ShowObject]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: getColumns(), spacing: 0.0){
                ForEach(objects, id: \.self) { obj in
                    ShowObjectView(obj: obj, size: size)
                }
            }
        }
    }
    
    func getColumns() -> [GridItem] {
        var columns: [GridItem] = []
        var i = 0
        while i < buttonsAcross {
            columns.append(
                GridItem(.flexible(minimum: 100, maximum: 500))
                )
            i = i + 1
        }
        return columns
    }
}

struct ObjectGrid_Previews: PreviewProvider {
    static var previews: some View {
        ObjectGrid(
            size: "small",
            buttonsAcross: 5,
            objects: testShowObjects)
    }
}
