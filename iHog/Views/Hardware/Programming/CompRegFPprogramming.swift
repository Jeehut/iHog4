//
//  CompRegFPprogrammingView.swift
//  iHog
//
//  Created by Maegan Wilson on 9/28/20.
//

import SwiftUI

struct CompRegFPprogramming: View {
    var body: some View {
        VStack{
//            ScrollView{
//                HStack{
//                    Spacer().frame(height: 0)
//                }
//                HBCButtonView()
//                SelectButtonView()
//                    .padding(.vertical)
//                OpenPartsView()
//            }
//            .padding(.bottom)
            VStack{
                HBCButtonView()
                HStack{
                    Button {
                        print("Encoders")
                    } label: {
                        Image(systemName: "dial.max")
                    }.buttonStyle(FrontPanelButton(width: 65, backgroundColor: .systemGray3))
                    Spacer()
                    Button {
                        print("Action buttons and such")
                    } label: {
                        Image(systemName: "rectangle.3.offgrid")
                    }.buttonStyle(FrontPanelButton(width: 65, backgroundColor: .systemGray3))
                    Spacer()
                    Button {
                        print("Encoders")
                    } label: {
                        Image(systemName: "square.grid.3x3")
                    }.buttonStyle(FrontPanelButton(width: 65, backgroundColor: .systemGray3))
                }
                HStack{
                    Button("Back"){print("back")}.buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                    Spacer()
                    Button("All"){print("all")}.buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                    Spacer()
                    Button("Next"){print("next")}.buttonStyle(FrontPanelButton(width: 65, backgroundColor: .gray))
                }
            }.padding(.bottom, BASE_PADDING)
            Spacer()
            NumericKeypadView()
        }
    }
}

struct CompRegFPprogrammingView_Previews: PreviewProvider {
    static var previews: some View {
        CompRegFPprogramming()
    }
}
