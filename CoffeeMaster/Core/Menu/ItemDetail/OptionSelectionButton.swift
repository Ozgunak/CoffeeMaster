//
//  OptionSelectionButton.swift
//  CoffeeMaster
//
//  Created by özgün aksoy on 2023-09-30.
//

import SwiftUI

struct OptionSelectionButton: View {
    let title: String
    let ingridient: String
    var isChanged: Bool
    @Binding var count: Int?
    var body: some View {
        HStack {
            Text(ingridient)
                .font(.subheadline)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            if let count {
                HStack {
                    Image(systemName: "minus.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(isChanged ? .white : Color.sbuxLightGreen)
                        .background(isChanged ? Color.sbuxLightGreen : .white)
                        .clipShape(Circle())
                    Text(String(count))
                        .font(.subheadline)
                    Image(systemName: "plus.circle")
                        .resizable()
                        .scaledToFill()
                        .foregroundStyle(isChanged ? .white : Color.sbuxLightGreen)
                        .background(isChanged ? Color.sbuxLightGreen : .white)
                        .frame(width: 20, height: 20)
                        .clipShape(Circle())
                        .padding(.trailing)

                }
            } else {
                Image(systemName: "chevron.down.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(isChanged ? .white : Color.sbuxLightGreen)
                    .background(isChanged ? Color.sbuxLightGreen : .white)
                    .clipShape(Circle())
                    .padding(.trailing)

            }
        }
        .background {
            RoundedRectangle(cornerRadius: 6.0)
//                .fill(isChanged ? .accent : .primary)
                .stroke(isChanged ? Color.sbuxLightGreen : .primary, lineWidth: isChanged ? 2 : 1)
//                .foregroundStyle( isChanged ? .accent : .primary)

                .overlay(alignment: .topLeading) {
                    Text(title)
                        .font(.footnote)
                        .padding(.horizontal, 4)
                        .background(.white)
                        .offset(x: 11, y: -6)
                }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    OptionSelectionButton(title: "Milk", ingridient: "%2 Milk", isChanged: true, count: .constant(nil))
}

