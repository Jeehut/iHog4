//
//  FPProgrammer.swift
//  iHog
//
//  Created by Maegan Wilson on 9/25/20.
//

import SwiftUI

struct FPProgrammer: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    var body: some View {
        switch horizontalSizeClass {
        case .regular:
            if verticalSizeClass == .regular {
                RegRegFPProgramming()
                    .navigationTitle("SolaSpot 1000 1 > 10 @ 100%")
                    .navigationBarTitleDisplayMode(.inline)
            } else {
                RegCompFPProgramming()
                    .navigationTitle("SolaSpot 1000 1 > 10 @ 100%")
                    .navigationBarTitleDisplayMode(.inline)
            }
        default: // compact
            if verticalSizeClass == .regular {
                CompRegFPprogramming()
                    .navigationTitle("SolaSpot 1000 1 > 10 @ 100%")
                    .navigationBarTitleDisplayMode(.inline)
            } else {
                RegCompFPProgramming()
                    .navigationTitle("SolaSpot 1000 1 > 10 @ 100%")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct FPProgrammer_Previews: PreviewProvider {
    static var previews: some View {
        FPProgrammer()
    }
}
