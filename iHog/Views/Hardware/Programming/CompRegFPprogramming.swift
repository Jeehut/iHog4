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
                HStack{
                    HalfHeightButtonFP()
                    HalfHeightButtonFP()
                        .padding(.horizontal, HALF_PADDING)
                    HalfHeightButtonFP()
                }.padding(.bottom, HALF_PADDING)
                HStack{
                    HalfHeightButtonFP()
                    HalfHeightButtonFP()
                        .padding(.horizontal, HALF_PADDING)
                    HalfHeightButtonFP()
                }.padding(.bottom, HALF_PADDING)
                HStack{
                    HalfHeightButtonFP()
                    HalfHeightButtonFP()
                        .padding(.horizontal, HALF_PADDING)
                    HalfHeightButtonFP()
                }
            }.padding(.bottom, HALF_PADDING)
            NumericKeypadView()
        }
    }
}

struct CompRegFPprogrammingView_Previews: PreviewProvider {
    static var previews: some View {
        CompRegFPprogramming()
    }
}

struct HalfHeightButtonFP: View {
    var body: some View {
        Button(action: {print("HELLP")}){
            Text("Blind")
                .frame(
                    minWidth: BASE_BUTTON_SIZE*1.5,
                    minHeight: BASE_BUTTON_SIZE/2,
                    alignment: .center
                )
                .padding(HALF_PADDING)
                .foregroundColor(.primary)
        }
        .background(Color.gray)
    }
}
