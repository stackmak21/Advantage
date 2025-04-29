//
//  RatingStarsView.swift
//  Advantage
//
//  Created by Paris Makris on 28/4/25.
//

import SwiftUI

struct RatingStarsView: View {
    
    let rating: Double
    
    var body: some View {
        starsView
            .overlay{
                overlayView.mask(starsView)
            }
    }
    
    private var overlayView: some View{
        GeometryReader{ proxy in
            ZStack(alignment: .leading){
                Rectangle()
                    .foregroundColor(Color.customLightYellow)
                    .frame(width: calculateRating() / 5 * proxy.size.width)
            }
        }
    }
    
    private var starsView: some View{
        HStack(spacing: 0){
            ForEach((1...5), id: \.self){ i in
                Image(systemName: "star.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color.customLightGray)
            }
        }
    }
    
    func calculateRating() -> Double{
        let roundedRating = rating.rounded() / 2
        return roundedRating
    }
}

#Preview {
    RatingStarsView(rating: 9.6)
        .frame(width: 100)
}
