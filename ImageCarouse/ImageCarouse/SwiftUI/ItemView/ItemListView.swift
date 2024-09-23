//
//  ItemListView.swift
//  ImageCarouse
//
//  Created by APPLE on 23/09/24.
//
import SwiftUI

struct ItemListView: View {
    @State private var items: [String] = ["Apple", "Banana", "Orange", "Blueberry"]
    @State private var searchText: String = ""

    var filteredItems: [String] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.contains(searchText) }
        }
    }

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(10)
                TextField("Search", text: $searchText)
                    .padding(1)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
            List {
                ForEach(filteredItems, id: \.self) { item in
                    HStack {
                        Image("tropical")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                        VStack(alignment: .leading) {
                            Text(item)
                                .font(.headline)
                        }
                    }

                }
            }
            .listStyle(.plain)
        }
    }
}
