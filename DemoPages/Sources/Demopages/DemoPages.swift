///
//  @filename   DemoPages.swift
//  @package    SwiftUIPageDemos
//
//  @author     jeffy
//  @date       2023/11/30
//  @abstract
//
//  Copyright © 2023 and Confidential to jeffy All rights reserved.
//

import SwiftUI
import I18NResource

public struct DemoPages: View {

    public init(){}
    
    public var body: some View {
        NavigationSplitView {
            List {
//                ForEach(items) { item in
                    NavigationLink {
                        Text("HELLO_WORLD", bundle: .i18n)
                    } label: {
                        Text("HELLO_WORLD", bundle: .i18n)
                    }
                }
//            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
            }
        } detail: {
            Text("Select an item")
        }
    }
}

#Preview {
    DemoPages()
}
