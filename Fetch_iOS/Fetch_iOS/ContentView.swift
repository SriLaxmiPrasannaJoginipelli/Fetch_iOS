//
//  ContentView.swift
//  Fetch_iOS
//
//  Created by Sri Laxmi Prasanna on 10/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var groupedItems: [[Item]] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(groupedItems, id: \.self) { group in
                    Section(header: Text("List ID: \(group.first!.listId)")) {
                        ForEach(group, id: \.id) { item in
                            Text(item.name ?? "Unknown")
                        }
                    }
                }
            }
            .navigationTitle("Items")
        }
        .onAppear {
            fetchData { items in
                if let items = items {
                    DispatchQueue.main.async {
                        self.groupedItems = processItems(items)
                    }
                }
            }
        }
    }
}

