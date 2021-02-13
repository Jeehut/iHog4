//
//  IAPHelper.swift
//  iHog
//
//  Created by Maegan Wilson on 2/12/21.
//

import Foundation
import StoreKit

public typealias ProductIdentifier = String
public typealias ProductsRequestCompletionHandler = (_ success: Bool, _ products: [SKProduct]?) -> Void

extension Notification.Name {
  static let IAPHelperPurchaseNotification = Notification.Name("IAPHelperPurchaseNotification")
}

open class IAPHelper: NSObject  {
  var purchaseAmount: NSDecimalNumber = 0
  private let productIdentifiers: Set<ProductIdentifier>
  
  // tracks what has been purchased
  private var purchasedProductIdentifiers: Set<ProductIdentifier> = []
  
  // These two are properties to perform requests to Apple servers
  private var productsRequest: SKProductsRequest?
  private var productsRequestCompletionHandler: ProductsRequestCompletionHandler?
  
  public init(productIds: Set<ProductIdentifier>) {
    productIdentifiers = productIds
    
    for productIdentifier in productIds {
      let purchased = UserDefaults.standard.bool(forKey: productIdentifier)
      if purchased {
        purchasedProductIdentifiers.insert(productIdentifier)
        if productIdentifier == "fp1-high" || productIdentifier == "fp1-highest" || productIdentifier == "fp1-low" ||
            productIdentifier == "fp1-mid" {
            UserDefaults.standard.set(true, forKey: "puntPageIsEnabled")
        }
        print("Previously purchsed: \(productIdentifier)")
      } else {
        print("Not purchased: \(productIdentifier)")
      }
    }
    
    super.init()
    
    SKPaymentQueue.default().add(self)
  }
}

// MARK: - StoreKit API
extension IAPHelper {
  
  // This saves the user's completion handler for future execution
  public func requestProducts(_ completionHandler: @escaping ProductsRequestCompletionHandler) {
    productsRequest?.cancel()
    productsRequestCompletionHandler = completionHandler
    
    productsRequest = SKProductsRequest(productIdentifiers: productIdentifiers)
    productsRequest!.delegate = self
    productsRequest!.start()
  }
  
  public func buyProduct(_ product: SKProduct) {
    print("Buying \(product.productIdentifier)...")
    let payment = SKPayment(product: product)
    purchaseAmount = product.price
    SKPaymentQueue.default().add(payment)
  }
  
  public func isProductPurchased(_ productIdentifier: ProductIdentifier) -> Bool {
    return purchasedProductIdentifiers.contains(productIdentifier)
  }
  
  public class func canMakePayments() -> Bool {
    return SKPaymentQueue.canMakePayments()
  }
  
  public func restorePurchases() {
    SKPaymentQueue.default().restoreCompletedTransactions()
  }
}

extension IAPHelper: SKProductsRequestDelegate {
  
  // GETS list of products, their titles, descriptions and prices from Apple's servers
  
  public func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
    print("Loaded list of products....")
    let products = response.products
    productsRequestCompletionHandler?(true, products)
    clearRequestAndHandler()
    
    for p in products {
      print("Found product: \(p.productIdentifier) \(p.localizedTitle) \(p.price.floatValue)")
    }
  }
  
  public func request(_ request: SKRequest, didFailWithError error: Error) {
    print("FAILED TO LOAD A LIST OF PRODUCTS")
    print("Error: \(error.localizedDescription)")
    productsRequestCompletionHandler?(false, nil)
    clearRequestAndHandler()
  }
  
  private func clearRequestAndHandler(){
    productsRequest = nil
    productsRequestCompletionHandler = nil
  }
}

extension IAPHelper: SKPaymentTransactionObserver {
  
  public func paymentQueue(_ queue: SKPaymentQueue,
                           updatedTransactions transactions: [SKPaymentTransaction]) {
    for transaction in transactions {
      switch transaction.transactionState {
        case .purchased:
          complete(transaction: transaction)
          break
        case .failed:
          fail(transaction: transaction)
          break
        case .restored:
          restore(transaction: transaction)
          break
        case .deferred:
          break
        case .purchasing:
          break
        default:
          break
      }
    }
  }
  
  private func complete(transaction: SKPaymentTransaction) {
    print("complete...")
    deliverPurchaseNotificationFor(identifier: transaction.payment.productIdentifier)
    UserDefaults.standard.set(true, forKey: "puntPageIsEnabled")
    SKPaymentQueue.default().finishTransaction(transaction)
  }
  
  private func restore(transaction: SKPaymentTransaction) {
    guard let productIdentifier = transaction.original?.payment.productIdentifier else { return }
    
    print("restore... \(productIdentifier)")
    deliverPurchaseNotificationFor(identifier: productIdentifier)
    SKPaymentQueue.default().finishTransaction(transaction)
  }
  
  private func fail(transaction: SKPaymentTransaction) {
    print("fail...")
    if let transactionError = transaction.error as NSError?,
      let localizedDescription = transaction.error?.localizedDescription,
      transactionError.code != SKError.paymentCancelled.rawValue {
      print("Transaction Error: \(localizedDescription)")
    }
    
    SKPaymentQueue.default().finishTransaction(transaction)
  }
  
  private func deliverPurchaseNotificationFor(identifier: String?) {
    guard let identifier = identifier else { return }
    
    purchasedProductIdentifiers.insert(identifier)
    UserDefaults.standard.set(true, forKey: identifier)
    UserDefaults.standard.set(true, forKey: "puntPageIsEnabled")
    NotificationCenter.default.post(name: .IAPHelperPurchaseNotification, object: identifier)
  }
}
