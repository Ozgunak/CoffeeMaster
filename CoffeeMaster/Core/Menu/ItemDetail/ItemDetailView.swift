//
//  ItemDetailView.swift
//  CoffeeMaster
//
//  Created by özgün aksoy on 2023-09-29.
//

import SwiftUI
import Kingfisher

struct ItemDetailView: View {
    @State private var selectedSize: SizeOptions = .grande
    @Namespace var animation
    var item: Coffee
    var isIncluded: Bool {
        item.ingredients.contains(where: { $0.lowercased().contains("milk")}) || item.ingredients.contains(where: { $0.lowercased().contains("espresso")})
    }

    init(item: Coffee) {
        self.item = item
    
    }
    
    var body: some View {
        ZStack {
            VStack {
                header
                    .padding(.horizontal)
                    .padding(.top, 20)

                ScrollView {
                    VStack {
                        VStack {
                            
                            CoffeeItemView(coffee: item, isTextTitle: true)
                            
                            divider(text: "Size options")
                                .padding(.top)
                            
                            options
                            
                            if isIncluded {
                                divider(text: "What's included")
                                    .padding(.top)
                            }

                            includeds
                            
                            customizeButtonView
                            
                            resetButtonView
                           
                        }
                        .padding(.horizontal)

                        // MARK: info
                        VStack {
                            
                            itemStarView
                            
                            descreptionView
                            calorieView
                            nutritionButtonView
                            
                        }
                        .background(Color.sbuxDarkGreen)
                        .padding(.top)
                        
                    }
                }
            }
        }
    }
}

extension ItemDetailView {
    private var header: some View {
        HStack(alignment: .center) {
                Image(systemName: "heart")
                Image(systemName: "square.and.arrow.up")
                    .padding(.horizontal)
                Spacer()
                Image(systemName: "xmark")
            }
    }
    
    private func divider(text: String) -> some View {
        VStack {
            Text(text)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            Rectangle().foregroundStyle(.green.opacity(0.3))
                .frame(height: 3)
                .frame(maxWidth: .infinity)
        }
    }
    
    private var options: some View {
        HStack {
            ForEach(SizeOptions.allCases) { option in
                VStack {
                    switch option{
                    case .short:
                        SizeSelectionView(name: option.name, ml: option.ml, isSelected: selectedSize == .short, animation: animation)
                            .onTapGesture {
                                withAnimation(.spring) {
                                    selectedSize = .short
                                }
                            }
                    case .tall:
                        SizeSelectionView(name: option.name, ml: option.ml, isSelected: selectedSize == .tall, animation: animation)
                            .onTapGesture {
                                withAnimation(.spring) {
                                    selectedSize = .tall
                                }
                            }
                    case .grande:
                        SizeSelectionView(name: option.name, ml: option.ml, isSelected: selectedSize == .grande, animation: animation)
                            .onTapGesture {
                                withAnimation(.spring) {
                                    selectedSize = .grande
                                }
                            }
                    case .venti:
                        SizeSelectionView(name: option.name, ml: option.ml, isSelected: selectedSize == .venti, animation: animation)
                            .onTapGesture {
                                withAnimation(.bouncy) {
                                    selectedSize = .venti
                                }
                            }
                    }
                }
            }
        }
    }
    
    private var includeds: some View {
        Group {
            if item.ingredients.contains(where: {$0.lowercased().contains("milk")}) {
                OptionSelectionButton(title: "Milk", ingridient: "Milk Foam", isChanged: false, count: .constant(nil))
                OptionSelectionButton(title: "Milk", ingridient: "%2 Milk", isChanged: true, count: .constant(nil))
                OptionSelectionButton(title: "Milk", ingridient: "Steamed Hot", isChanged: true, count: .constant(nil))
            }
            if item.ingredients.contains(where: {$0.lowercased().contains("espresso")}) {
                OptionSelectionButton(title: "Espresso & Shot Options", ingridient: "Signature Espresso Roast", isChanged: false, count: .constant(nil))
                OptionSelectionButton(title: "Espresso & Shot Options", ingridient: "2 Shots + -", isChanged: false, count: .constant(2))
            }
        }
    }
    
    private var customizeButtonView: some View {
        HStack {
            Image(systemName: "wand.and.stars")
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color.sbuxGold)
                .frame(width: 28, height: 28)
            
            Text("Customize")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }
        .background {
            Capsule()
                .frame(width: 200, height: 56)
                .foregroundStyle(Color.sbuxDarkGreen)
            
        }
        .padding(.top, 32)
    }
    
    private var resetButtonView: some View {
        Text("Reset to standard recipe")
            .font(.footnote)
            .fontWeight(.semibold)
            .padding(.horizontal)
            .padding(.vertical, 4)
            .overlay {
                Capsule()
                    .stroke(lineWidth: 1)
            }
            .foregroundStyle(Color.sbuxLightGreen)
            .padding(.top)
    }
    
    private var itemStarView: some View {
        HStack(spacing: 0) {
            Text("200")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.vertical, 4)
            Image(systemName: "star.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 10)
            Text(" item")
                .font(.subheadline)
                .fontWeight(.semibold)
        }
        .padding(.horizontal)
        .overlay {
            Capsule()
                .stroke(lineWidth: 1)
        }
        .foregroundStyle(Color.sbuxGold)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .padding(.top, 32)
    }
    
    private var descreptionView: some View {
        Text(item.description)
            .font(.footnote)
            .foregroundStyle(.white)
            .padding(.vertical, 4)
            .frame(maxWidth: .infinity, alignment: .center)
        
    }
    
    private var calorieView: some View {
        Text("140 Calories, 12g sugar, 5g fat")
            .font(.title2)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        
    }
    
    private var nutritionButtonView: some View {
        Text("Full nutrition & ingredient list")
            .font(.subheadline)
            .fontWeight(.semibold)
            .padding(.horizontal)
            .padding(.vertical, 4)
            .overlay {
                Capsule()
                    .stroke(lineWidth: 1)
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.bottom, 40)
        
    }
}


#Preview {
    ItemDetailView(item: Coffee.MOCK_COFFEE)
}






