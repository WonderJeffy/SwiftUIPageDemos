///
//  @filename   DemoApp.swift
//  @package
//
//  @author     jeffy
//  @date       2023/12/12
//  @abstract
//
//  Copyright © 2023 and Confidential to jeffy All rights reserved.
//

import SwiftUI
import SwiftData

@main
struct DemoApp: App {

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            DemoPages()
        }
        .modelContainer(sharedModelContainer)
    }
}
