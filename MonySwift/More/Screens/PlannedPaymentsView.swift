//
//  PlannedPaymentsView.swift
//  MonySwift
//
//  Created by Isa Melsov on 15/6/25.
//

import SwiftUI

struct PlannedPaymentsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showPopup = false
    @State private var showManualInput = false
    @State private var selectedDate = Date()
    @State private var manualDateText = ""
    
    var body: some View {
        ZStack {
            Color(.darkBlue).ignoresSafeArea()
            
            VStack {
                LottieView(animationName: "calendarLottie")
                    .frame(height: 250)
                    .background(Color.clear)
                    .padding(.vertical)
                
                Text("Запланированные платежи будут\nздесь")
                    .foregroundStyle(.white)
                    .font(.system(size: 24, weight: .medium))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding(.vertical)
                
                Text("Пока что тут пусто. Создайте запланированный\nплатеж, чтобы увидеть его здесь.")
                    .foregroundStyle(.white)
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                
                // 👉 Только кнопка
                Button("Создать") {
                    showPopup = true
                }
                .frame(maxWidth: .infinity, minHeight: 60)
                .background(RoundedRectangle(cornerRadius: 30).fill(.blue))
                .foregroundStyle(.white)
                .padding()
                
                Spacer()
            }
            
            // 👉 Всплывающее окно отдельно, поверх
            if showPopup {
                PopUpCalendarView(
                    showPopup: $showPopup,
                    showManualInput: $showManualInput,
                    selectedDate: $selectedDate,
                    manualDateText: $manualDateText
                )
                .zIndex(1)
                .transition(.scale)
            }
        }
        .animation(.easeInOut, value: showPopup)
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
                Text("Запланированные платежи")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(.white)
            }
        }
        .toolbarBackground(Color(.darkBlue), for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
    }
}




struct PopUpCalendarView: View {
    @Binding var showPopup: Bool
    @Binding var showManualInput: Bool
    @Binding var selectedDate: Date
    @Binding var manualDateText: String
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    showPopup = false
                    showManualInput = false
                }
            
            VStack(spacing: 16) {
                Text("Выберите дату")
                    .foregroundColor(.white)
                    .font(.headline)
                
                HStack {
                    Text(showManualInput ? "Введенная дата" : "Выбранная дата")
                        .foregroundColor(.lightBlue)
                        .font(.title3)
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            showManualInput.toggle()
                        }
                    } label: {
                        Image(systemName: "pencil")
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                    }
                }
                
                if showManualInput {
                    TextField("Дата", text: $manualDateText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.top, 8)
                } else {
                    CustomDatePicker()

                }
                
                HStack {
                    Button("Отмена") {
                        showPopup = false
                        manualDateText = ""
                        showManualInput = false
                    }
                    .foregroundColor(.lightBlue)
                    
                    Spacer()
                    
                    Button("Продолжить") {
                        if showManualInput {
                            print("Введенная дата: \(manualDateText)")
                        } else {
                            print("Выбранная дата: \(selectedDate)")
                        }
                        showPopup = false
                        showManualInput = false
                    }
                    .foregroundColor(.blue)
                    .disabled(showManualInput && manualDateText.isEmpty)
                    .opacity(showManualInput && manualDateText.isEmpty ? 0.5 : 1)
                }
                .padding(.top, 8)
            }
            .background(.lightBlue)
            .padding()
            .background(.white)
            .cornerRadius(16)
            .padding(32)
        }
    }
}



#Preview {
    NavigationStack {
        PlannedPaymentsView()
    }
}


