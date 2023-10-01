//
//  HomeView.swift
//  CoffeeMaster
//
//  Created by özgün aksoy on 2023-09-30.
//

import SwiftUI

struct HomeView: View {
    private var list = [25, 100, 200, 300, 400]

    var body: some View {
        NavigationStack {
            header
            ScrollView {
                VStack {
                    cardView
                }
            }
            .navigationTitle("It's your season, Ozgun 🍁")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

extension HomeView {
    private var header: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "envelope")
                    Text("Inbox")
                        .font(.subheadline)
                }
                
                HStack {
                    Image(systemName: "location.circle")
                    Text("Stores")
                        .font(.subheadline)
                }
                .padding(.leading)
                
                Spacer()
                
                Image(systemName: "list.bullet.rectangle.portrait")
                    .padding(.trailing)
                
                Image(systemName: "person.circle")
            }
            .padding(.horizontal)
            
            Divider()
        }
        
        
    }
    private var cardView: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        Text("715")
                            .font(.title)
                            .padding(.trailing, -4)
                        Image(systemName: "star.fill")
                    }
                    .foregroundStyle(Color.sbuxDarkGreen)
                    Text("Star balance")
                        .font(.footnote)
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Text("Reward options")
                        .font(.footnote)
                        .fontWeight(.medium)
                    Image(systemName: "chevron.down")
                }
            }
                
            VStack {
                ZStack {
                    Capsule()
                        .frame(height: 2)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundStyle(Color.sbuxGold)
                            HStack {
                                ForEach(0...4, id: \.self) { index in
                                    VStack(spacing: 1) {
                                        Image(systemName: "drop.fill").rotationEffect(.degrees(180))
                                            .foregroundStyle(index == 4 ? Color.sbuxDarkGreen : .clear)
                                            .frame(height: 30)
                                        Circle()
                                            .frame(width: 15, height: 15)
                                        .padding(.horizontal)
                                        .foregroundStyle(Color.sbuxGold)

                                        Text("\(list[index])")
                                            .foregroundStyle(.primary)
                                            .font(.footnote)
                                            .fontWeight(.semibold)
                                            .frame(height: 30)
                                            

                                    }
                                    if index != 4 {
                                        Spacer()
                                    }
                                }
                            }
                        
                }
                .frame(maxWidth: .infinity, alignment: .center)
//                .padding(.top)
            }
            HStack(spacing: 20) {
                Text("Details")
                    .font(.callout)
                    .foregroundStyle(Color.sbuxDarkGreen)
                    .padding(.vertical, 4)
                    .padding(.horizontal)
                    .background {
                        Capsule().stroke(lineWidth: 1)
                }
            
            Text("Redeem")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
                .padding(.vertical, 4)
                .padding(.horizontal)
                .background {
                    Capsule().fill(Color.sbuxDarkGreen)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

#Preview {
    HomeView()
}
