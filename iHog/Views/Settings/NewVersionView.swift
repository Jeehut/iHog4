//
//  NewVersionView.swift
//  iHog
//
//  Created by Maegan Wilson on 1/24/22.
//

import SwiftUI
import Purchases

struct NewVersionView: View {
    @AppStorage(Settings.build.rawValue) var buildNumber = 125
    @AppStorage(Settings.version.rawValue) var version = 2022.1

    @Binding var selectedSetting: SettingsNav?

    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    let appBuild = Bundle.main.infoDictionary?["CFBundleVersion"] as! String

    let products = TippingProducts().getProducts()

    @State private var coffeeProduct: Purchases.Package?

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                VStack(alignment: .leading) {
                    Group {
                        Text("\(Image(systemName: "checkmark.square")) Enhancements")
                            .font(.headline)
                            .foregroundColor(Color.green)
                        Text("Focus View")
                        Text("OSC improvements")
                    }
                    .padding(.bottom)

                    Group {
                        Text("\(Image(systemName: "x.square")) Fixes")
                            .font(.headline)
                            .foregroundColor(Color.red)
                        Text("Crash when connect to other device on the network")
                        Text("Group selection was not working")
                        Text("Function keys were not receiving labels")
                        Text("Release notes in app")
                    }
                    .padding(.bottom)
                }.frame(maxWidth: .infinity)
            }
            HStack  {
                Button {
                    let url = URL(string: "itms-apps://itunes.apple.com/app/1487580623")
                    UIApplication.shared.open(url!)
                } label: {
                    VStack(spacing: 20) {
                        HStack {
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.leadinghalf.fill")
                        }.foregroundColor(.orange)
                        Text("Leave a Review")
                            .font(.headline)
                            .lineLimit(nil)
                        Text("A review helps other people find the app and let's Maegan know if they are working in the right direction.")
                            .lineLimit(nil)
                    }
                    .foregroundColor(.primary)
                    .padding()
                    .background(.ultraThickMaterial)
                    .cornerRadius(5.0)
                }
                Spacer()
                Button {
                    Purchases.shared.purchasePackage(coffeeProduct!) { (transaction, purchaserInfo, error, userCancelled) in
                        print("THANKS FOR SUPPORTING A DEVELOPER")
                    }
                } label: {
                    VStack {
                        Image(systemName: "cup.and.saucer")
                            .foregroundColor(.blue)
                            .padding(.bottom, 10)
                        Text("Buy a Coffee")
                            .font(.headline)
                            .lineLimit(nil)
                            .padding(.bottom, 10)
                        if coffeeProduct != nil {
                            HStack {
                                Text(coffeeProduct?.localizedPriceString ?? "")
                                    .padding(.all, 5.0)
                                    .background(.ultraThickMaterial)
                            }.background(Color.blue)
                                .cornerRadius(5.0)
                                .padding(.bottom, 10)
                        }
                        Text("Support a solo developer on their mission to new enhancements and fix bugs.")
                            .lineLimit(nil)
                            .padding(.bottom, 10)
                    }.foregroundColor(.black)
                    .padding()
                    .background(.ultraThickMaterial)
                    .cornerRadius(5.0)
                }
            }
        }
        .navigationTitle(Text("v\(appVersion) (\(appBuild))"))
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            for product in products {
                print(product.identifier)
                if product.identifier == "medium" {
                    coffeeProduct = product
                }
            }
        }
    }
}
