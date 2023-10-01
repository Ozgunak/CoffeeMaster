//
//  ItemImageView.swift
//  CoffeeMaster
//
//  Created by özgün aksoy on 2023-09-30.
//

import SwiftUI
import Kingfisher

struct ItemImageView: View {
    var imageDimentions: CGFloat
    let url: String
    
    init(imageDimentions: CGFloat = 180, url: String) {
        self.imageDimentions = imageDimentions
        self.url = url
    }
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
