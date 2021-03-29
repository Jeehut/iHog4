//
//  TipJarView.swift
//  iHog
//
//  Created by Maegan Wilson on 2/20/21.
//

import SwiftUI
import StoreKit
import Purchases
import CoreData

struct TipJarView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: TipEntity.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \TipEntity.dateTipped, ascending: true)]) var tips: FetchedResults<TipEntity>
    
    @State private var totalTipped: Double = 0.0
    //    @State private var products: [SKProduct] = []
    @State private var packages: [Purchases.Package] = []
    
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
            Text("Any contribution is greatly welcomed, but please don't feel like you must tip.")
                .padding()
            List{
                ForEach(packages, id: \.identifier){ package in
                    PurchRow(package: package, reasonToPurchase: "tip")
                        .padding(.vertical)
//                    PurchRow(product: product, store: store, reasonToPurchase: "tip").padding(.vertical)
                }
            }
            .onReceive(pub) { (output) in
                print("TIP JAR: \(output)")
                self.addTipToCoreData(of: output.object as? String)
            }
        }
        .navigationBarTitle("Tip Jar")
        .onAppear {
            Purchases.shared.offerings { (offerings, error) in
                if let tipping = offerings?["tipping-default"]{
                    packages = tipping.availablePackages
                } else {
                    print(error.debugDescription)
                }
            
            }
            getTotalTipped()
        }
    }
    
    func addTipToCoreData(of identifier: String?) {
        var amountTipped = 0.0
        switch identifier ?? "not found" {
        case "h4tier1":
            amountTipped = Double(truncating: packages[0].product.price)
        case "h4tier2":
            amountTipped = Double(truncating: packages[1].product.price)
        case "h4tier3":
            amountTipped = Double(truncating: packages[2].product.price)
        case "h4tier4":
            amountTipped = Double(truncating: packages[3].product.price)
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
