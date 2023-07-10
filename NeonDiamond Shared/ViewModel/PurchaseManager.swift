//
//  PurchaseManager.swift
//  NeonDiamond iOS
//
//  Created by 99999999 on 22.06.2023.
//

import StoreKit
import Foundation
import SwiftUI

class PurchaseManager: NSObject, ObservableObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    @UserDefault(key: "hasPurchased", defaultValue: false)
        private var hasPurchasedDefault: Bool

        lazy var hasPurchased: Bool = self.hasPurchasedDefault

        override init() {
            super.init()
        }

    // Fetch the product from the App Store
    func fetchProducts() {
        let request = SKProductsRequest(productIdentifiers: ["UnlockMediumAndHardLevels"])
        request.delegate = self
        request.start()
    }

    // When the product is received from the App Store
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if let product = response.products.first {
            // Prompt the user to buy the product
            buyProduct(product)
        }
    }

    // Initiate the purchase process
    func buyProduct(_ product: SKProduct) {
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
    }

    // Handle the transaction status
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchased:
                // Unlock the content
                SKPaymentQueue.default().finishTransaction(transaction)
                hasPurchased = true
                hasPurchasedDefault = true
                queue.finishTransaction(transaction)
            case .failed, .restored, .deferred, .purchasing:
                break
            @unknown default:
                break
            }
        }
    }
}
