//
//  AppProducts.swift
//  iHog
//
//  Created by Maegan Wilson on 2/12/21.
//

import Foundation

public struct HogOSCProducts {
    
    public static let coffee = "h4tier3"
    public static let heart = "h4tier2"
    public static let hundred = "h4tier4"
    public static let smile = "h4tier1"
    
    private static let productIdentifiers: Set<ProductIdentifier> = [HogOSCProducts.smile, HogOSCProducts.heart, HogOSCProducts.coffee, HogOSCProducts.hundred]
    
    public static let store = IAPHelper(productIds: HogOSCProducts.productIdentifiers)
}

public struct FeaturePack {
    public static let fp1 = "fp1"
    public static let fp2 = "fp2"
    public static let fp3 = "fp3"
    public static let fp4 = "fp4"
    
    private static let productIdentifiers: Set<ProductIdentifier> = [FeaturePack.fp1, FeaturePack.fp2, FeaturePack.fp3, FeaturePack.fp4]
    
    public static let store = IAPHelper(productIds: FeaturePack.productIdentifiers)
}

func resourceNameForProductIdentifier(_ productIdentifier: String) -> String? {
    return productIdentifier.components(separatedBy: ".").last
}
