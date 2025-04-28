//
//  ImageLoader.swift
//  Advantage
//
//  Created by Paris Makris on 28/4/25.
//

import SwiftUI
import Kingfisher

struct ImageLoader: View {
    let url: String
    let width: CGFloat?
    let height: CGFloat?
    
    init(
        url: String,
        width: CGFloat? = nil,
        height: CGFloat? = nil
    ) {
        self.url = url
        self.width = width
        self.height = height
    }
    
    var body: some View {
        ZStack {
            if let urlValue = URL(string: url) {
                GeometryReader { proxy in
                    KFImage(urlValue)
                        .resizable()
                        .placeholder {
                            Rectangle()
                                .frame(width: proxy.size.width, height: proxy.size.height)
                        }
                        .loadDiskFileSynchronously()
                        .fade(duration: 0)
                        .scaledToFill()
                        .frame(width: proxy.size.width, height: proxy.size.height)
                        .clipped()
                }
                .frame(width: width, height: height)
            }
        }
    }
}

#Preview {
    ImageLoader(
        url: "https://picsum.photos/800/1003",
        width: 200,
        height: 200
    )
}
