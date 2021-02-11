//
//  PPPurchaseView.swift
//  iHog
//
//  Created by Maegan Wilson on 2/11/21.
//

import SwiftUI

struct PPPurchaseView: View {
    @AppStorage(Settings.isPuntPagePurchased.rawValue) var isPuntPagePurchased: Bool = false
    var body: some View {
        Toggle("Purchase PuntPage", isOn: $isPuntPagePurchased)
    }
}

struct PPPurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PPPurchaseView()
    }
}
