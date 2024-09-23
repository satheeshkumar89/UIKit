//
//  ContentView.swift
//  ImageCarouse
//
//  Created by APPLE on 23/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented: Bool = false
    @State private var items: [String] = ["Apple", "Banana", "Orange", "Blueberry"]

    var body: some View {
        ZStack {
            Color(Color.green.opacity(0.2))
                .ignoresSafeArea()
            
            VStack {
                ImageCarouselView()
                ItemListView()
                Spacer()
            }
            .padding()

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        isPresented.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                            .shadow(radius: 5)
                    }
                    .padding()
                    .sheet(isPresented: $isPresented) {
                        StatisticsView(items: items)
                    }
                }
            }
            .padding(.bottom, 30)
            .padding(.trailing, 20)
        }
    }
}

struct StatisticsView: View {
    let items: [String]
    var itemCount: Int {
        items.count
    }

    var topThreeCharacters: [(String, Int)] {
        let characters = items.joined().reduce(into: [:]) { counts, letter in
            counts[String(letter), default: 0] += 1
        }
        return characters.sorted { $0.value > $1.value }.prefix(3).map { ($0.key, $0.value) }
    }

    var body: some View {
        VStack {
            Text("Item Count: \(itemCount)")
            ForEach(topThreeCharacters, id: \.0) { character, count in
                Text("\(character): \(count) occurrences")
            }
        }
    }
}

#Preview {
    ContentView()
}
