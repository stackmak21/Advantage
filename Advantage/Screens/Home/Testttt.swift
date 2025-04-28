//
//  Testttt.swift
//  Advantage
//
//  Created by Paris Makris on 28/4/25.
//

import SwiftUI

struct Testttt: View {
    var body: some View {
        VStack{
            ScrollView(.vertical) {
                VStack{
                    ForEach(1..<15) { i in
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 50)
                    }
                    
                    ScrollView(.horizontal) {
                        HStack{
                            ForEach(1..<15) { i in
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 50)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    Testttt()
}
