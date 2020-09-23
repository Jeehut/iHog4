//
//  ShowObjectView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/21/20.
//

import SwiftUI

struct ShowObjectView: View {
    var obj: ShowObject
    var size: String
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(obj.getShortType())
                Spacer()
                Text("\(obj.getObjNumber())")
            }
            Spacer()
            Text(obj.getName())
                .font(.headline)
        }
        .frame(width: getSize(), height: getSize(), alignment: .leading)
        .padding()
        .background(obj.isOutlined ? Color.clear : getColor())
        .cornerRadius(4.0)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(getColor(), lineWidth: 5)
        ).padding()
    }
    
    func getSize() -> CGFloat{
        switch size {
        case "small":
            return 50.0
        case "medium":
            return 100.0
        case "large":
            return 150.0
        case "extra large":
            return 200.0
        default:
            return 100.0
        }
    }
    
    func getColor() -> Color{
        switch obj.objColor {
        case "red":
            return .red
        default:
            return .gray
        }
    }
}

struct ShowObjectView_Previews: PreviewProvider {
    static var previews: some View {
        ShowObjectView(
            obj: testShowObjects[1],
            size: "small"
        )
    }
}
