//
//  ImageCarouselView.swift
//  ImageCarouse
//
//  Created by APPLE on 23/09/24.
//

import SwiftUI


struct ImageCarouselView: View {
    let images: [String] = ["tropical", "tropical", "tropical"]
    @State private var currentPage = 0
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.blue
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.gray 
    }
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<images.count, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(15)
                        .padding()
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 300)
        }
        .animation(.easeInOut, value: currentPage)
    }
}




