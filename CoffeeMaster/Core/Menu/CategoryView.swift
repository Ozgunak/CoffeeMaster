//
//  CategoryView.swift
//  CoffeeMaster
//
//  Created by özgün aksoy on 2023-09-29.
//

import SwiftUI

struct CategoryView: View {
    @Environment(\.dismiss) var dismiss
    @State var categories = ItemCategory.MOCK_CATEGORIES
    @State private var isPresented: Bool = false

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
                                Button {
                                    isPresented.toggle()
                                } label: {
                                    CoffeeItemView(coffee: coffee)
                                        .containerRelativeFrame(.horizontal, count: 2, spacing: 24.0)
                                }
                                .sheet(isPresented: $isPresented, content: {
                                    ItemDetailView(item: coffee)
                                })
                            }
                        }
                    }
                    .contentMargins(20, for: .scrollContent)
                    .scrollTargetBehavior(.viewAligned)
                    
                    Divider()
                }
            }
        }
        
        .navigationBarBackButtonHidden()
        .toolbar {
//            ToolbarItem(placement: .topBarLeading) {
//                Image(systemName: "chevron.left")
//                    .imageScale(.large)
//                    .onTapGesture {
//                        dismiss()
//                    }
//            }
            ToolbarItem(placement: .topBarLeading) {
                Image.backItem
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
        
    }
}

extension Image {
    static var backItem: some View {
        Image(systemName: "chevron.left")
            .imageScale(.large)
            .padding()
            
    }
}

#Preview {
    NavigationStack {
        CategoryView()
    }
}
