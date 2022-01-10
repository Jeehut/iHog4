//
//  PPPurchaseView.swift
//  iHog
//
//  Created by Maegan Wilson on 2/11/21.
//

import SwiftUI
import StoreKit
import Purchases

struct PPPurchaseView: View {
    @AppStorage(Settings.puntPageIsEnabled.rawValue) var puntPageIsEnabled: Bool = false
    @State private var products: [SKProduct] = []
    @State private var packages: [Purchases.Package] = []
    
    static let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()

        formatter.formatterBehavior = .behavior10_4
        formatter.numberStyle = .currency

        return formatter
    }()
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("Unlock Punt Page")
                    .font(.largeTitle)
                    .padding(.bottom)
                Text("Thanks for checking out this page. Without a purchase, you won't be able to use it.").padding(.bottom)
                Text("By making a purchase you are unlocking the Punt Page features.")
                Button(action:{
                    let url = NSURL(string: "https://ihogapp.com/release-notes/punt-page-feature"
                    )
                    UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
                }){
                    HStack{
                        Text("Learn more about Punt Page")
                    }
                    .padding(.all)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                }.padding(.all)

                Text("Please pay what you think the Punt Page is worth. A lot of time and effort went into making sure these screens will look good and function on your device.")

            }.padding(.horizontal)

            List{
                Button(action: {
                    print("Trying to restore")
                    Purchases.shared.restoreTransactions { (purchaserInfo, error) in
                        //... check purchaserInfo to see if entitlement is now active
                        if purchaserInfo?.entitlements["punt-page"]?.isActive == true{
                            puntPageIsEnabled = true
                        } else {
                            print(error as Any)
                        }
                    }
                }) {
                    Text("Restore purchases")
                        .padding(.all, 8)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                ForEach(packages, id: \.identifier){ package in
                    PurchRow(package: package, reasonToPurchase: "Punt Page Feature")
                        .padding(.vertical)
                }
            }
            Spacer()
        }
        .onAppear{
            print("HELLO")
            Purchases.shared.offerings { (offerings, error) in
                if let puntPage = offerings?["punt-page-default"] {
                    packages = puntPage.availablePackages
                } else {
                    print(error.debugDescription)
                }
            }
        }
    }
}

struct PPPurchaseView_Previews: PreviewProvider {
    static var previews: some View {
        PPPurchaseView()
    }
}
