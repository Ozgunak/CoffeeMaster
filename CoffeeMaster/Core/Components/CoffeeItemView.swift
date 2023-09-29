//
//  CoffeeItemView.swift
//  CoffeeMaster
//
//  Created by özgün aksoy on 2023-09-29.
//

import SwiftUI

struct CoffeeItemView: View {
    let coffee: Coffee
    var body: some View {
        VStack {
            Circle().foregroundStyle(.green.gradient)
            Text(coffee.title)
                .font(.subheadline)
        }
        .containerRelativeFrame(.horizontal, count: 2, spacing: 48.0)
    }
}

#Preview {
    CoffeeItemView(coffee: Coffee.MOCK_COFFEE)
}
