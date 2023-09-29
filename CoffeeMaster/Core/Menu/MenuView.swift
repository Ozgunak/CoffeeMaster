//
//  MenuView.swift
//  CoffeeMaster
//
//  Created by özgün aksoy on 2023-09-28.
//

import SwiftUI
import Kingfisher

@MainActor
class MenuViewModel: ObservableObject {
//    @Published var coffees: [CoffeeData] = []
    
    init() {
//        coffees = DataManager.loadCoffeeData()
    }
}
                                
struct MenuView: View {
    @StateObject var viewModel = MenuViewModel()
    
    @State private var products: [ProductCategory] = ProductCategory.MOCK_PRODUCT_CATEGORIES
    @State private var types: [ProductType] = ProductType.MOCK_PRODUCT_TYPES


    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ForEach(types) { type in
                        HeaderView(title: type.name, count: type.categories.count, action: nil)
                        ForEach(type.categories) { category in
                            NavigationLink {
                                CategoryView(categories: category.coffees)
                                    .navigationTitle(category.name)
                            } label: {
                                CategoryItemView(imageUrl: category.categoryImageUrl, title: category.name)
                            }
                        }
                    }
                }
                    
            }
            .navigationTitle("Order")
        }
    }
}



#Preview {
    NavigationStack {
        MenuView()
    }
}




