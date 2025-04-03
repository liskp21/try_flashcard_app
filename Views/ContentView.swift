import SwiftUI

struct ContentView: View {
    @StateObject private var flashcardStore = FlashcardStore()
    @State private var showingAddFlashcard = false
    @State private var selectedCategory: Category?
    @State private var showingCreateCategory = false
    
    var filteredFlashcards: [Flashcard] {
        if let selectedCategory = selectedCategory {
            return flashcardStore.flashcards.filter { $0.category == selectedCategory }
        } else {
            return flashcardStore.flashcards
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Category", selection: $selectedCategory) {
                    Text("All").tag(Category?.none)
                    ForEach(flashcardStore.categories) { category in
                        Text(category.name).tag(category as Category?)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .overlay(
                    HStack {
                        Spacer()
                        Button(action: {
                            showingCreateCategory = true
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.blue)
                        }
                        .padding(.trailing, 8)
                    }
                )
                
                if filteredFlashcards.isEmpty {
                    Text("No flashcards yet")
                        .foregroundColor(.gray)
                } else {
                    List {
                        ForEach(flashcardStore.categories) { category in
                            Section(header: Text(category.name)) {
                                ForEach(flashcardStore.flashcards.filter { $0.category == category }) { flashcard in
                                    FlashcardView(flashcard: flashcard)
                                        .frame(height: 150)
                                        .padding(.vertical, 8)
                                }
                                .onDelete(perform: flashcardStore.deleteFlashcard)
                            }
                        }
                        .onDelete(perform: flashcardStore.deleteCategory)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    showingAddFlashcard = true
                }) {
                    Text("Add Flashcard")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .sheet(isPresented: $showingAddFlashcard) {
                AddFlashcardView(flashcardStore: flashcardStore)
            }
            .navigationTitle("Flashcards")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape")
                    }
                }
            }
        }
    }
} 