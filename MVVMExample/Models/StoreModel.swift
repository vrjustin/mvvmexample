//
//  StoreModel.swift
//  MVVMExample
//
//  Created by Justin Maronde on 8/27/24.
//

import Foundation

@MainActor
class StoreModel: ObservableObject {
    
    let webservice: Webservice
    @Published var products: [Product] = []
    
    init(webservice: Webservice) {
        self.webservice = webservice
    }
    
    func populateProducts() async throws {
        products = try await webservice.getProducts()
    }
    
}
