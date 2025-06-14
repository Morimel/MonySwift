//
//  AccountView.swift
//  MonySwift
//
//  Created by Isa Melsov on 6/6/25.
//

import SwiftUI

struct AccountView: View {
    @State private var selectedTab = 0
    @Namespace private var underlineNamespace

    var body: some View {
        ZStack {
            Color(.darkBlue).ignoresSafeArea()

            VStack(spacing: 0) {
                TopArea()

                SegmentedHeader(
                    selectedTab: $selectedTab,
                    tabs: ["Счета", "Всего"],
                    underlineNamespace: underlineNamespace
                )

                AccountTabView(selectedTab: $selectedTab)
            }
        }
    }
}

struct SegmentedHeaderTab: View {
    let title: String
    let isSelected: Bool
    let underlineNamespace: Namespace.ID
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 6) {
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(isSelected ? Color(.systemBlue) : Color(.gray))
                    .frame(maxWidth: .infinity)

                SegmentedHeaderUnderline(isVisible: isSelected, namespace: underlineNamespace)
            }
            .padding(.vertical, 8)
        }
    }
}

struct SegmentedHeader: View {
    @Binding var selectedTab: Int
    let tabs: [String]
    var underlineNamespace: Namespace.ID

    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabs.indices, id: \.self) { index in
                SegmentedHeaderTab(
                    title: tabs[index],
                    isSelected: selectedTab == index,
                    underlineNamespace: underlineNamespace
                ) {
                    withAnimation(.spring()) {
                        selectedTab = index
                    }
                }
            }
        }
        .background(
            // Прямо поверх HStack, фоновая серая линия
            Rectangle()
                .fill(Color.gray.opacity(0.4))
                .frame(height: 1)
                .offset(y: -8)
            ,
            alignment: .bottom
        )
        .background(Color(.darkBlue))
    }
}

struct SegmentedHeaderUnderline: View {
    let isVisible: Bool
    let namespace: Namespace.ID

    var body: some View {
        ZStack {
            if isVisible {
                Capsule()
                    .fill(Color(.systemBlue))
                    .matchedGeometryEffect(id: "underline", in: namespace)
                    .frame(height: 3)
            } else {
                Color.clear.frame(height: 3)
            }
        }
    }
}

struct AccountTabView: View {
    @Binding var selectedTab: Int

    var body: some View {
        TabView(selection: $selectedTab) {
            ScrollView {
                SegmentFirst()
            }
            .tag(0)

            ScrollView {
                SegmentSecond()
            }
            .tag(1)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct SegmentedControl: View {
    @Binding var selectedTab: Int
    let tabs: [String]

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(tabs.indices, id: \.self) { index in
                    Button(action: {
                        withAnimation {
                            selectedTab = index
                        }
                    }) {
                        VStack(spacing: 8) {
                            Text(tabs[index])
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(selectedTab == index ? .white : .gray)
                                .frame(maxWidth: .infinity)

                            Rectangle()
                                .fill(selectedTab == index ? .white : .clear)
                                .frame(height: 3)
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
            }

            Rectangle()
                .fill(Color.gray.opacity(0.4))
                .frame(height: 1)
        }
        .background(Color(.darkBlue))
    }
}

#Preview {
    AccountView()
}
