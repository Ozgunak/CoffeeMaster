//
//  ItemImageView.swift
//  CoffeeMaster
//
//  Created by özgün aksoy on 2023-09-30.
//

import SwiftUI
import Kingfisher

struct ItemImageView: View {
    var imageDimentions: CGFloat = 220
    let url: String
    var body: some View {
        KFImage(URL(string: url))
            .resizable()
            .scaledToFill()
            .scaleEffect(CGSize(width: 1.6, height: 1.6))
            .offset(y: 40)
            .frame(width: imageDimentions, height: imageDimentions)
            .clipShape(Circle())    }
}

#Preview {
    ItemImageView(url: Coffee.MOCK_COFFEE.imageUrl)
}
