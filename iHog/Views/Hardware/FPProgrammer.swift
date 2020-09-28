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
            } else {
                RegCompFPProgramming()
            }
        default: // compact
            if verticalSizeClass == .regular {
                Text("\(horizontalSizeClass.debugDescription) x \(verticalSizeClass.debugDescription)")
            } else {
                Text("comp x comp")
            }
        }
    }
}

struct FPProgrammer_Previews: PreviewProvider {
    static var previews: some View {
        FPProgrammer()
    }
}
