//
//  HeaderView.swift
//  CoffeeMaster
//
//  Created by özgün aksoy on 2023-09-29.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let count: Int
    let action: (() -> ())?
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top)
            
            Spacer()
            Button(action: action ?? {}, label: {
                Text("See all \(count)")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(.green)
            })
        }
        .padding(.horizontal)    }
}

#Preview {
    HeaderView(title: "", count: 1, action: nil)
}
