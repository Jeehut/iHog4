//
//  CompactFaders.swift
//  iHog
//
//  Created by Maegan Wilson on 2/5/21.
//

import SwiftUI

struct CompactFaders: View {
    var body: some View {
        VStack{
            HStack{
                FPButton(buttonText: "Next Page",
                         buttonFunction: ButtonFunctionNames.nextpage)
            }
            ScrollView(.vertical){
                LazyVStack{
                    ForEach(1 ..< 90) { num in
                        HorizontalMasterView(masterNumber: num).padding(.all, BASE_PADDING)
                    }
                }
            }
        }
    }
}

struct CompactFaders_Previews: PreviewProvider {
    static var previews: some View {
        CompactFaders()
    }
}
