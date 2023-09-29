//
//  CategoryView.swift
//  CoffeeMaster
//
//  Created by özgün aksoy on 2023-09-29.
//

import SwiftUI

struct CategoryView: View {
    @State var categories = ItemCategory.MOCK_CATEGORIES

    init(categories: [ItemCategory] = ItemCategory.MOCK_CATEGORIES) {
        self.categories = categories
    }
    var body: some View {
        ScrollView {
            ForEach(categories) { category in
                VStack(alignment: .leading) {
                   
                    HeaderView(title: category.name, count: category.coffees.count, action: nil)
                    
                    ScrollView(.horizontal) {
                        HStack(alignment: .firstTextBaseline) {
                            ForEach(category.coffees) { coffee in
                                CoffeeItemView(coffee: coffee)
                            }
                        }
                    }
                    .contentMargins(20, for: .scrollContent)
                    .scrollTargetBehavior(.viewAligned)
                    
                    Divider()
                }
            }
        }  
    }
}

#Preview {
    CategoryView()
}
