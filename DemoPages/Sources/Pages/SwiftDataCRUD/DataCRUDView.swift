//
//  DataCRUDView.swift
//
//
//  Created by jeffy on 2024/1/8.
//

import SwiftData
import SwiftUI

/// Create + Read + Update + Delete
struct DataCRUDView: View {
    @Environment(\.modelContext) private var modelContext

    @Query private var items: [Item]

    @State private var searchText = ""

    private var filterItems: [Item] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter {
                $0.name.localizedStandardContains(searchText)
            }
        }
    }
    
    var body: some View {
        List {
            Button(action: addItem) {
                Label("Add Item", systemImage: "plus")
            }
            ForEach(filterItems) { item in
                NavigationLink {
                    ItemDetailView(item: item)
                } label: {
                    Text(item.name)
                }
            }
            .onDelete(perform: deleteItems)
        }
        .searchable(text: $searchText)
    }

    private func addItem() {
        let newItem = Item(timestamp: Date(), name: "default")
        modelContext.insert(newItem)
    }

    private func deleteItems(offsets: IndexSet) {
        offsets.map { items[$0] }.forEach(modelContext.delete)
    }
}

struct ItemDetailView: View {
    @Bindable var item: Item
    var body: some View {
        Form {
            TextField("Name", text: $item.name)
        }
        .navigationTitle("Edit Item")
    }
}

#Preview {
    DataCRUDView()
}
