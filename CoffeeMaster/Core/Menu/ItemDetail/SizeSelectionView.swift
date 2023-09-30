//
//  SizeSelectionView.swift
//  CoffeeMaster
//
//  Created by özgün aksoy on 2023-09-30.
//

import SwiftUI

struct SizeSelectionView: View {
    let name: String
    let ml: Int
    let isSelected: Bool
    var animation: Namespace.ID?
    @Namespace var placeholderAnimation // only for preview
    var body: some View {
        VStack {
            ZStack {
                if isSelected {
                    Circle().foregroundStyle(.green.opacity(0.25))
                        .frame(width: 64, height: 64)
                        .overlay {
                            Circle().stroke(lineWidth: 2)
                                .foregroundStyle(.accent)
                        }
                        .matchedGeometryEffect(id: "ml", in: animation ?? placeholderAnimation)
                }
                ZStack {
                    Circle().fill(isSelected ? .accent : .clear).frame(width: 10, height: 10)
                        .offset(x: -3)
                    Image(systemName: "mug")                    // TODO: change images according to selection
                        .resizable()
                        .scaledToFill()
                        .frame(width: 28, height: 28)
                }
                
            }
            .frame(width: 64, height: 64)
            
            Text(name)
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.top, 6)
            Text("\(ml) ml")
                .font(.caption)
        }
    }
}

#Preview {
    SizeSelectionView(name: "Grande", ml: 342, isSelected: true)
}

enum SizeOptions: Int, CaseIterable, Identifiable {
    case short
    case tall
    case grande
    case venti
    
    var ml: Int {
        switch self {
        case .short:
            return 236
        case .tall:
            return 354
        case .grande:
            return 473
        case .venti:
            return 591
        }
    }
    
    var name: String {
        switch self {
        case .short:
            return "Short"
        case .tall:
            return "Tall"
        case .grande:
            return "Grande"
        case .venti:
            return "Venti"
        }
    }
    
    var image: some View {
        switch self {
        case .short:
            return Image(systemName: "mug")
                .resizable()
                .scaledToFill()
                .frame(width: 28, height: 16)
        case .tall:
            return Image(systemName: "mug")
                .resizable()
                .scaledToFill()
                .frame(width: 28, height: 20)
        case .grande:
            return Image(systemName: "mug")
                .resizable()
                .scaledToFill()
                .frame(width: 28, height: 24)
        case .venti:
            return Image(systemName: "mug")
                .resizable()
                .scaledToFill()
                .frame(width: 28, height: 28)
        }
    }
    
    var id: Int { self.rawValue }
}
