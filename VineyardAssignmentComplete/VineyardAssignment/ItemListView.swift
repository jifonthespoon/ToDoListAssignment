//
//  ItemListView.swift
//  VineyardAssignment
//
//  Created by Rahul on 9/5/24.
//

import SwiftUI

struct ItemListView: View {
    let list: ItemList
    
    @State private var showingAddItem: Bool = false
    @State private var newItemText = ""
    
    var body: some View {
        List(list.items) { item in
            HStack {
                Button {
                    withAnimation {
                        list.toggleItemAsCompleted(item)
                    }
                } label: {
                    Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                        .imageScale(.large)
                        .contentTransition(.symbolEffect(.replace))
                }
                .foregroundStyle(item.isCompleted ? .green : .accentColor)
                .buttonStyle(.plain)
                
                Text(item.title)
            }
        }
        .navigationTitle(list.name)
        .toolbar {
            Button("Add Item", systemImage: "plus") {
                showingAddItem.toggle()
            }
        }
        .alert("Add Item", isPresented: $showingAddItem) {
            TextField("Item Title", text: $newItemText)
            Button("Cancel", role: .cancel) {
                newItemText = ""
            }
            Button("Add") {
                list.addItem(newItemText)
                newItemText = ""
            }
            .disabled(newItemText.isEmpty)
        } message: {
            Text("Add item to \(list.name)")
        }

    }
}

#Preview {
    NavigationStack {
        ItemListView(list: .init(name: "Test List", items: [
            .init(title: "Item 1", isCompleted: false),
            .init(title: "Item 2", isCompleted: false),
            .init(title: "Item 3", isCompleted: false)
        ]))
    }
}
