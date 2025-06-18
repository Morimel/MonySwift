import SwiftUI

struct AddCategory: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedIcon: String = "person.fill"
    @State private var currency: String = "Киргизский сом"
    @State private var subcategories: [String] = []
    
    
    @State private var showIconPopup = false
    
    
    @State private var showTypeDialog = false
    @State private var selectedType: String = "Расходы"
    
    
    @State private var showCurrencyPicker = false
    
    @State private var goToIconSelector = false

    
    var body: some View {
        NavigationStack {
            ZStack {
                
                
                // Основной экран
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 28) {
                        
                        CategoryName()
                        
                        // Иконка
                        HStack {
                            Text("Иконка")
                                .foregroundColor(.white)
                                .font(.title3)
                                .fontWeight(.medium)
                                .padding()
                            
                            Spacer()
                            
                            Image(systemName: selectedIcon)
                                .foregroundColor(.green)
                                .padding(.trailing, 12)
                        }
                        .frame(height: 80)
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
                        .onTapGesture {
                            showIconPopup = true
                        }
                        
                        
                        TypeView(selectedType: $selectedType) {
                            showTypeDialog = true
                        }
                        
                        // Валюта
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Валюта счета")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                            Text(currency)
                                .foregroundColor(.blue)
                                .fontWeight(.medium)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray)
                        )
                        .onTapGesture {
                            showCurrencyPicker = true
                        }
                        
                        Spacer()
                    }
                    .padding()
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
                        Text("Новая категория")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundStyle(.white)
                    }
                }
                .toolbarBackground(Color(.darkBlue), for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar)
                .navigationBarBackButtonHidden(true)
                
                
                //MARK: - Popup Icon
                if showIconPopup {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
                        .onTapGesture {
                            showIconPopup = false
                        }
                    
                    VStack(spacing: 20) {
                        // Иконка сверху
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.teal.opacity(0.3))
                            .frame(maxWidth: .infinity, minHeight: 74, maxHeight: 74)
                            .padding(.horizontal)
                            .overlay(
                                Image(systemName: "photo.on.rectangle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                            )
                            .padding(.top, 20)
                        
                        // Заголовок
                        Text("Настроить иконку")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        // Две горизонтальные кнопки
                        HStack(spacing: 4) {
                            IconPopupButton(
                                icon: "face.smiling",
                                text: "Выбор иконки",
                                radius: 12,
                                corners: [.topLeft, .bottomLeft],
                                action: {
                                    goToIconSelector = true
                                }
                            )
                            .padding(.leading, 12)

                            
                            IconPopupButton(icon: "paintpalette", text: "Выбор цвета", radius: 12, corners: [.topRight, .bottomRight], action:  {
                                print("")
                            })
                                .padding(.trailing, 12)
                        }
                        
                        // Вертикальные кнопки
                        VStack(spacing: 4) {
                            IconPopupButton(icon: "gearshape", text: "Настройка случайного выбора", radius: 12, corners: [.topLeft, .topRight], action:  {
                                print("")
                            })
                            
                            IconPopupButton(icon: "face.smiling", text: "Случайная иконка", radius: 0, corners: [], action:  {
                                print("")
                            })
                            
                            IconPopupButton(icon: "paintpalette", text: "Случайный цвет", radius: 0, corners: [], action:  {
                                print("")
                            })
                            
                            IconPopupButton(icon: "sparkles", text: "Случайная иконка и цвет", radius: 12, corners: [.bottomLeft, .bottomRight], action:  {
                                print("")
                            })
                        }
                        .padding(.horizontal)
                        
                        // Готово
                        Button(action: {
                            showIconPopup = false
                        }) {
                            Text("Готово")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                    }
                    .frame(maxWidth: 360)
                    .background(Color.lightBlue)
                    .cornerRadius(24)
                    .padding()
                }
                
                
                
                //MARK: - PopUp Type
                if showTypeDialog {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
                        .onTapGesture {
                            showTypeDialog = false
                        }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Выберите тип")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding([.top, .leading], 20)
                        
                        VStack(spacing: 16) {
                            TypeOptionRow(title: "Расходы", icon: "arrow.up", selected: selectedType == "Расходы") {
                                selectedType = "Расходы"
                                showTypeDialog = false
                            }
                            
                            TypeOptionRow(title: "Доходы", icon: "arrow.down", selected: selectedType == "Доходы") {
                                selectedType = "Доходы"
                                showTypeDialog = false
                            }
                        }
                        
                        HStack {
                            Spacer()
                            Button("Отмена") {
                                showTypeDialog = false
                            }
                            .foregroundColor(.blue)
                            .padding()
                        }
                    }
                    .frame(maxWidth: 300)
                    .background(Color.lightBlue)
                    .cornerRadius(20)
                    .padding()
                }
            }
            .navigationDestination(isPresented: $goToIconSelector) {
                    ChooseIconView()
                }
        }
        .fullScreenCover(isPresented: $showCurrencyPicker) {
            CurrencyPickerView(selectedCurrency: $currency)
        }
    }
    
    struct IconPopupButton: View {
        var icon: String
        var text: String
        var radius: CGFloat
        var corners: UIRectCorner
        var action: () -> Void // ⬅️ новый параметр

        var body: some View {
            Button(action: action) {
                HStack(spacing: 12) {
                    Image(systemName: icon)
                        .foregroundColor(.white)
                        .frame(width: 24, height: 24)
                    Text(text)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
                .background(
                    Color.darkBlue.opacity(0.7)
                        .clipShape(RoundedCorner(radius: radius, corners: corners))
                )
            }
        }
    }


    
    
    struct TypeView: View {
        @Binding var selectedType: String
        var onTap: () -> Void
        
        var body: some View {
            VStack(alignment: .leading) {
                Text("Тип")
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontWeight(.medium)
                    .padding(.vertical, 8)
                
                HStack {
                    Image(systemName: selectedType == "Расходы" ? "arrow.up" : "arrow.down")
                        .foregroundColor(selectedType == "Расходы" ? .blue : .green)
                    Text(selectedType)
                        .foregroundColor(selectedType == "Расходы" ? .blue : .green)
                    Spacer()
                }
                .padding(.bottom, 12)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
            .onTapGesture {
                onTap()
            }
        }
    }
    
    
    struct CurrencyPickerView: View {
        @Environment(\.dismiss) var dismiss
        @Binding var selectedCurrency: String
        
        let usedCurrencies = ["Киргизский сом"]
        let mainCurrencies = [
            ("Австралийский доллар", "A$"),
            ("Британский фунт стерлингов", "£"),
            ("Доллар США", "$"),
            ("Евро", "€"),
            ("Канадский доллар", "CA$"),
            ("Китайский юань", "CN¥"),
            ("Украинская гривна", "грн.")
        ]
        
        var body: some View {
            
            NavigationStack {
                List {
                    Section(header:
                                Text("Используемые валюты")
                        .foregroundStyle(.white)
                    ) {
                        ForEach(usedCurrencies, id: \.self) { currency in
                            CurrencyRow(name: currency, code: "KGS", selected: selectedCurrency == currency) {
                                selectedCurrency = currency
                                dismiss()
                            }
                        }
                    }
                    
                    Section(header:
                                Text("Основные валюты")
                        .foregroundStyle(.white)
                    ) {
                        ForEach(mainCurrencies, id: \.0) { currency in
                            CurrencyRow(name: currency.0, code: currency.1, selected: selectedCurrency == currency.0) {
                                selectedCurrency = currency.0
                                dismiss()
                            }
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.darkBlue)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "xmark")
                                .font(.system(size: 18, weight: .medium))
                                .foregroundStyle(.white)
                        }
                    }
                    
                    ToolbarItem(placement: .principal) {
                        Text("Выберите валюту")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundStyle(.white)
                    }
                }
            }
            .toolbarBackground(Color(.darkBlue), for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .navigationBarBackButtonHidden(true)
        }
    }
    
    struct CurrencyRow: View {
        let name: String
        let code: String
        let selected: Bool
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                HStack {
                    Image(systemName: selected ? "largecircle.fill.circle" : "circle")
                        .foregroundColor(selected ? .blue : .gray)
                    Text(name)
                    Spacer()
                    Text(code)
                        .foregroundColor(.gray)
                }
            }
            .listRowBackground(Color.darkBlue)
        }
    }
    
    
    
    struct CategoryName: View {
        
        @State private var name: String = ""
        
        var body: some View {
            // Названиеz
            ZStack {
                // Внешняя рамка
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    .frame(maxWidth: .infinity, minHeight: 140)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Название")
                        .foregroundColor(.white)
                        .font(.title3)
                        .fontWeight(.medium)
                        .padding(.bottom, 8)
                    
                    
                    PlaceholderTextField(placeholder: "Введите название", text: $name, placeholderColor: .white)
                    
                }
                .padding(.horizontal)
            }
        }
    }
    
    struct TypeOptionRow: View {
        let title: String
        let icon: String
        let selected: Bool
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                HStack(spacing: 12) {
                    Image(systemName: selected ? "largecircle.fill.circle" : "circle")
                        .foregroundStyle(selected ? .blue : .white)
                    Image(systemName: icon)
                        .foregroundColor(.white)
                    Text(title)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding()
            }
        }
    }
    
    
    struct PlaceholderTextField: View {
        var placeholder: String
        @Binding var text: String
        var placeholderColor: Color = .gray
        
        var body: some View {
            ZStack(alignment: .leading) {
                // Показываем текст-плейсхолдер, только если поле пустое
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(placeholderColor)
                        .padding(.horizontal, 12)
                }
                
                TextField("", text: $text)
                    .padding(12)
                    .foregroundColor(.white) // цвет текста, не плейсхолдера
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.white.opacity(0.6), lineWidth: 1)
                            .frame(height: 60)
                    )
            }
        }
    }
}


#Preview {
    AddCategory()
}
