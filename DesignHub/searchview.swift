//
//  searchview.swift
//  DesignHub
//
//  Created by Vikram Kumar on 02/06/26.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        List(viewModel.results, id: \.self) { result in
            Text(result)
        }
        .searchable(text: $viewModel.searchText)
        .onChange(of: viewModel.searchText) {
            viewModel.searchTextChanged()
        }
    }
}
