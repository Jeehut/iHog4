//
//  PurchasesHelpers.swift
//  iHog
//
//  Created by Maegan Wilson on 1/9/22.
//

import Foundation
import Purchases

public struct TippingProducts {
    private let tipProducts = ["h4tier1", "h4tier2", "h4tier3", "h4tier4"]

    func getProducts() -> [Purchases.Package] {
        var packages: [Purchases.Package] = []
        Purchases.shared.offerings { (offerings, error) in

            guard let offerings = offerings else {
                return
            }

            packages = offerings.offering(identifier: "tipping-default")?.availablePackages ?? []
        }
        return packages
    }

    func getTotalTipped() -> String {
        var totalTipped: NSDecimalNumber = 0.0
        var products: [SKProduct] = []

        Purchases.shared.products(tipProducts) { tipLevels in
            products = tipLevels
        }

        Purchases.shared.syncPurchases { purchaserInfo, error in
            guard let info = purchaserInfo else {
                print(error!)
                return
            }

            let transactions = info.nonSubscriptionTransactions
            print(transactions)
            for transaction in transactions {
                let productID = transaction.productId
                for product in products {
                    if productID == product.productIdentifier {
                        totalTipped = totalTipped.adding(product.price)
                    }
                }
            }
        }

        print("👍 \(totalTipped)")

        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current

        return currencyFormatter.string(from: totalTipped)!
    }
}
