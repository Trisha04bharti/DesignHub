//
//  customsearch.swift
//  DesignHub
//
//  Created by Vikram Kumar on 01/06/26.
//

import SwiftUI
import Combine

@MainActor
class SearchViewModel: ObservableObject {
    
    @Published var searchText = ""
    @Published var results: [String] = []
    
    private var searchTask: Task<Void, Never>?
    
    func searchTextChanged() {
        
        searchTask?.cancel()
        
        searchTask = Task {
            do {
                try await Task.sleep(for: .milliseconds(500))
                
                guard !Task.isCancelled else { return }
                
                await performSearch(searchText)
            } catch {
                // Task cancelled
            }
        }
    }
    
    private func performSearch(_ query: String) async {
        guard !query.isEmpty else {
            results = []
            return
        }
        
        print("Searching for: \(query)")
        
        // Simulate API call
        try? await Task.sleep(for: .seconds(1))
        
        results = [
            "\(query) Result 1",
            "\(query) Result 2",
            "\(query) Result 3"
        ]
    }
}
