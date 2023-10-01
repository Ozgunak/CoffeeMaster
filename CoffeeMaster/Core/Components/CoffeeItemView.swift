//
//  CoffeeItemView.swift
//  CoffeeMaster
//
//  Created by özgün aksoy on 2023-09-29.
//

import SwiftUI

struct CoffeeItemView: View {
    let coffee: Coffee
    let isTextTitle: Bool
    
    init(coffee: Coffee, isTextTitle: Bool = false) {
        self.coffee = coffee
        self.isTextTitle = isTextTitle
    }
    
    var body: some View {
        VStack {            
            ItemImageView(imageDimentions: isTextTitle ? 200 : 160, url: coffee.imageUrl)
            Text(coffee.title)
                .font(isTextTitle ? .title2 : .subheadline)
        }
    }
}

#Preview {
    CoffeeItemView(coffee: Coffee.MOCK_COFFEE)
}
