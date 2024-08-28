//
//  ContentView.swift
//  MVVMExample
//
//  Created by Justin Maronde on 8/27/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var storeModel: StoreModel
    
    private func populateProducts() async {
        do {
            try await storeModel.populateProducts()
        } catch {
            print(error)
        }
    }
        
    var body: some View {
        List(storeModel.products) { product in
            Text(product.title)
            Text(product.price as NSNumber, formatter: NumberFormatter.currency)
        }.task {
            await populateProducts()
        }
    }
}

#Preview {
    ContentView().environmentObject(StoreModel(webservice: Webservice()))
}
