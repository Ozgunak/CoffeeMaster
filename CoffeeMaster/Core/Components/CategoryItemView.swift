//
//  CategoryItemView.swift
//  CoffeeMaster
//
//  Created by özgün aksoy on 2023-09-29.
//

import SwiftUI

struct CategoryItemView: View {
    let imageUrl: String
    let title: String
    
    var body: some View {
        HStack(spacing: 16) {
            Circle().foregroundStyle(.green.gradient)
                .frame(width: 64, height: 64)
            Text(title)
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)                
        }
        .padding(.horizontal)
    }
}

#Preview {
    CategoryItemView(imageUrl: "", title: "Hot Coffees")
}
