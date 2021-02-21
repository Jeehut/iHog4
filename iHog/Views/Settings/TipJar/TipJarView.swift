//
//  TipJarView.swift
//  iHog
//
//  Created by Maegan Wilson on 2/20/21.
//

import SwiftUI
import StoreKit
import CoreData

struct TipJarView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: TipEntity.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \TipEntity.dateTipped, ascending: true)]) var tips: FetchedResults<TipEntity>
    
    @State private var totalTipped: Double = 0.0
    @State private var products: [SKProduct] = []
    
    var store = HogOSCProducts.store
    
    let pub = NotificationCenter.default
        .publisher(for: NSNotification.Name("IAPHelperPurchaseNotification"))
    static let priceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        
        formatter.formatterBehavior = .behavior10_4
        formatter.numberStyle = .currency
        
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .leading){
            Text("If you're enjoying iHog and want to drop some money into the tip jar, it workd definitely be appreciated!")
                .padding()
            Text("Total in Jar: \(TipJarView.priceFormatter.string(from: NSNumber(value: totalTipped)) ?? "NONE")")
                .font(.title)
                .foregroundColor((totalTipped > 0) ? .green : .primary)
                .padding()
            Text("Any contribution is greatly welcomed to help added functionality and new versions remain free of charge.")
                .padding()
            List{
                ForEach(self.products, id: \.productIdentifier){ product in
                    PurchRow(product: product, store: store, reasonToPurchase: "tip").padding(.vertical)
                }
            }
            .onReceive(pub) { (output) in
                print("TIP JAR: \(output)")
                self.addTipToCoreData(of: output.object as? String)
            }
        }
        .navigationBarTitle("Tip Jar")
        .onAppear {
            store.requestProducts{ (success, products) in
                if success {
                    self.products = products!
                }
            }
            getTotalTipped()
        }
    }
    
    func addTipToCoreData(of identifier: String?) {
        var amountTipped = 0.0
        switch identifier ?? "not found" {
        case "h4tier1":
            amountTipped = Double(truncating: products[0].price)
        case "h4tier2":
            amountTipped = Double(truncating: products[1].price)
        case "h4tier3":
            amountTipped = Double(truncating: products[2].price)
        case "h4tier4":
            amountTipped = Double(truncating: products[3].price)
        default:
            print("DO NOTHING")
        }
        
        let newTip = TipEntity(context: viewContext)
        newTip.amount = amountTipped
        newTip.dateTipped = Date()
        
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        getTotalTipped()
    }
    
    func getTotalTipped() {
        var total = 0.0
        for tip in tips {
            total += tip.amount
        }
        
        totalTipped = total
    }
}

struct TipJarView_Previews: PreviewProvider {
    static var previews: some View {
        TipJarView()
    }
}
