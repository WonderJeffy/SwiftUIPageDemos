///
//  @filename   SwiftUIPageDemosApp.swift
//  @package    SwiftUIPageDemos
//
//  @author     jeffy
//  @date       2023/11/30
//  @abstract
//
//  Copyright © 2023 and Confidential to jeffy All rights reserved.
//

import SwiftUI
import DemoPages
import SwiftData

@main
struct SwiftUIPageDemosApp: App {

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
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
//            DemoPages()
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
