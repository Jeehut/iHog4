//
//  IAPViews.swift
//  iHog
//
//  Created by Maegan Wilson on 2/12/21.
//

import SwiftUI
import StoreKit

struct PurchRow: View {
    @Environment(\.managedObjectContext) var context
    
    var product: SKProduct
    var store: IAPHelper
    var reasonToPurchase: String
    
    
    static let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        
        formatter.formatterBehavior = .behavior10_4
        formatter.numberStyle = .currency
        
        return formatter
    }()
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(getProductTitle())
                    .font(.headline)
                Text(getProductDescription())
                    .font(.body)
            }
            Spacer()
            Button(action: {
                print("Buy")
                store.buyProduct(self.product)
            }){
                Text("\(PurchRow.priceFormatter.string(from: self.product.price) ?? "--")")
                    .padding(.all, 8)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
    }
    
    func getProductTitle() -> String {
        switch product.productIdentifier {
        case "fp1", "h4tier1":
            return "😊"
        case "fp2", "h4tier2":
            return "❤️"
        case "fp3", "h4tier3":
            return "☕"
        case "fp4", "h4tier4":
            return "💯"
        default:
            return product.localizedTitle
        }
    }
    
    func getProductDescription() -> String {
        if reasonToPurchase != "tip" {
            switch product.productIdentifier {
            case "fp1":
                return "Small price for \(reasonToPurchase)"
            case "fp2":
                return "Medium price for \(reasonToPurchase)"
            case "fp3":
                return "High price for \(reasonToPurchase)"
            case "fp4":
                return "Giant price for \(reasonToPurchase)"
            default:
                return product.localizedTitle
            }
        } else {
            switch product.productIdentifier {
            case "h4tier1":
                return "Small Tip"
            case "h4tier2":
                return "Medium Tip"
            case "h4tier3":
                return "Large Tip"
            case "h4tier4":
                return "Giant Tip"
            default:
                return product.localizedTitle
            }
        }
    }
    
}

struct IAPViews: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct IAPViews_Previews: PreviewProvider {
    static var previews: some View {
        IAPViews()
    }
}
