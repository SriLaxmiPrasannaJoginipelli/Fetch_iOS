//
//  sortData.swift
//  Fetch_iOS
//
//  Created by Sri Laxmi Prasanna on 10/12/24.
//

import Foundation

func processItems(_ items: [Item]) -> [[Item]] {
    // Filter out items where 'name' is nil or empty
    let filteredItems = items.filter { $0.name != nil && !$0.name!.isEmpty }
    
    // Group the filtered items by 'listId'
    let grouped = Dictionary(grouping: filteredItems, by: { $0.listId })
    
    // Sort the groups by 'listId', then within each group, sort by 'id' and 'name'
    let sortedGroups = grouped
        .sorted { $0.key < $1.key }
        // Sort the groups by listId
        .map { listId, items in
            // Sort by 'id' first, then by 'name' if 'id's are same
            items.sorted {
                if $0.id == $1.id {
                    return $0.name! < $1.name!
                    // Sort by name if ids are equal
                } else {
                    return $0.id < $1.id
                    // Otherwise sort by id
                }
            }
        }
    
    return sortedGroups
}




