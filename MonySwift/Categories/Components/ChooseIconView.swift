//
//  ChooseIconView.swift
//  MonySwift
//
//  Created by Isa Melsov on 18/6/25.
//

import SwiftUI

struct ChooseIconView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack {
                IconsGrid(text: "Еда и напитки")
//                IconsGrid(text: "Общие")
//                IconsGrid(text: "Общие")
//                IconsGrid(text: "Общие")
//                IconsGrid(text: "Общие")
//                IconsGrid(text: "Общие")
//                IconsGrid(text: "Общие")
//                IconsGrid(text: "Общие")
//                IconsGrid(text: "Общие")
//                IconsGrid(text: "Общие")

                
            }
        }
        .background(Color.darkBlue.edgesIgnoringSafeArea(.all))
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundStyle(.white)
                }
            }
            
            ToolbarItem(placement: .principal) {
                Text("Выберите иконку")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(.white)
            }
        }
        .toolbarBackground(Color(.darkBlue), for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
    }
}

struct CustomDividerForIcons: View {
    
    let text: String
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color(UIColor.lightGray))
                .frame(height: 1)
                .layoutPriority(0)
            
            Text(text)
                .foregroundStyle(Color(UIColor.lightGray))
                .font(.title2)
                .padding(.horizontal, 8)
                .layoutPriority(1)
            
            Rectangle()
                .fill(Color(UIColor.lightGray))
                .frame(height: 1)
                .layoutPriority(0)
        }
    }
}

struct IconsGrid: View {
    
    let text: String
    
    let foodIcons = ["beer", "bottle", "bowl", "bowlChops", "cake", "cakeThreeCandles", "candy", "chicken", "coctail", "coffee", "croissant", "fish", "glassBottle", "hamburger", "iceCream", "junkFood", "lolipop", "pasta", "pizza", "plateSpoonFork", "pot", "spoonFork", "tea", "vodka"]
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: -16), count: 5)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            CustomDividerForIcons(text: text)
            
            LazyVGrid(columns: columns, alignment: .leading, spacing: 16) {
                ForEach(foodIcons, id: \.self) { icon in
                    Button(action: {
                       print("\(icon) tapped")
                    }) {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray, lineWidth: 1)
                            .aspectRatio(1, contentMode: .fit) // делает квадрат
                            .frame(width: 42, height: 42)
                            .overlay(
                                Image(icon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 28, height: 28)
                                    .foregroundColor(.white)
                            )
                    }
                }
            }
            .padding()
        }
    }
}


#Preview {
    ChooseIconView()
}
