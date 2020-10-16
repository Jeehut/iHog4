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
        .cornerRadius(BASE_CORNER_RADIUS)
        .overlay(
            RoundedRectangle(cornerRadius: (DOUBLE_CORNER_RADIUS))
                .stroke(getColor(), lineWidth: BASE_LINE_WIDTH)
        ).padding()
    }
    
    func getSize() -> CGFloat{
        switch size {
        case "small":
            return SMALL_OBJ_BUTTON_SIZE
        case "medium":
            return MEDIUM_OBJ_BUTTON_SIZE
        case "large":
            return LARGE_OBJ_BUTTON_SIZE
        case "extra large":
            return XL_OBJ_BUTTON_SIZE
        default:
            return MEDIUM_OBJ_BUTTON_SIZE
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
