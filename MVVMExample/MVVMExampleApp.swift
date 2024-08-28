//
//  MVVMExampleApp.swift
//  MVVMExample
//
//  Created by Justin Maronde on 8/27/24.
//

import SwiftUI

@main
struct MVVMExampleApp: App {
    
    @StateObject private var storeModel = StoreModel(webservice: Webservice())
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(storeModel)
        }
    }
}
