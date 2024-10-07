//
//  ViewModel.swift
//  VineyardAssignment
//
//  Created by Rahul on 9/5/24.
//

import SwiftUI

@Observable
class ViewModel {
    var lists: [ItemList] = [
        .init(name: "List 1", items: []),
        .init(name: "List 2", items: []),
    ]
    
    init() {}
    
    // MARK: - User Intents
    /// Create a new empty list.
    func createList(name: String) {
        let list: ItemList = .init(name: name, items: [])
        
        lists.append(list)
    }
    
    /// Add item to a list.
    func addItem(to list: ItemList, name: String) {
        list.addItem(name)
    }
    
    /// Toggle an item as complete.
    func toggleItemAsCompleted(_ item: ItemList.Item, list: ItemList) {
        list.toggleItemAsCompleted(item)
    }
}
