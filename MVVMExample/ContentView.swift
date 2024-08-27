//
//  ContentView.swift
//  MVVMExample
//
//  Created by Justin Maronde on 8/27/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ProductListViewModel(webservice: Webservice())
    
    var body: some View {
        List(vm.products) { product in
            Text(product.title)
        }.task {
            await vm.populateProducts()
        }
    }
}

#Preview {
    ContentView()
}
