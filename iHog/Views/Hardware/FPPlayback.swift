//
//  FPPlayback.swift
//  iHog
//
//  Created by Maegan Wilson on 9/30/20.
//

import SwiftUI

struct FPPlayback: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    var body: some View {
        if horizontalSizeClass == .regular {
            RegRegPlayback()
                .navigationBarTitleDisplayMode(.inline)
        } else {
            CompPlayback()
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FPPlayback_Previews: PreviewProvider {
    static var previews: some View {
        FPPlayback()
    }
}
