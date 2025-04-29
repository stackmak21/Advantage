//
//  ToolbarItems.swift
//  Advantage
//
//  Created by Paris Makris on 29/4/25.
//

import SwiftUI

struct ToolbarBackButton: ToolbarContent {
    
    var action: () -> Void
    
    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .navigationBarLeading) {
            Button {
                action()
            } label: {
                ToolbarImage(systemName: "chevron.backward")
            }
        }
    }
}

struct ToolbarTitle: ToolbarContent {
    
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .principal) {
            Text(title)
                .foregroundColor(Color.customBlack)
                .font(Typography.medium(size: 18))
                .frame(maxHeight: .infinity)
                .padding(.vertical, 8)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .fixedSize(horizontal: true, vertical: true)
        }
    }
}


struct ToolbarImage: View {
    
    var systemName: String
    var size: CGFloat
    var color: Color
    
    init(systemName: String, size: CGFloat = 22, color: Color = Color.customBlack) {
        self.systemName = systemName
        self.size = size
        self.color = color
    }
    
    var body: some View {
        Image(systemName: systemName)
            .font(Typography.medium(size: size))
            .foregroundColor(color)
    }
}
