import SwiftUI

struct AddFlashcardView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var flashcardStore: FlashcardStore
    
    @State private var question = ""
    @State private var answer = ""
    @State private var selectedCategory: Category
    @State private var showingCreateCategory = false
    
    init(flashcardStore: FlashcardStore) {
        self.flashcardStore = flashcardStore
        _selectedCategory = State(initialValue: flashcardStore.categories.first ?? Category(name: "General"))
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Flashcard Details")) {
                    TextField("Question", text: $question)
                    TextField("Answer", text: $answer)
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(flashcardStore.categories) { category in
                            Text(category.name).tag(category)
                        }
                    }
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
                }
            }
            .navigationTitle("Add Flashcard")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        flashcardStore.addFlashcard(question: question, answer: answer, category: selectedCategory)
                        presentationMode.wrappedValue.dismiss()
                    }
                    .disabled(question.isEmpty || answer.isEmpty)
                }
            }
            .sheet(isPresented: $showingCreateCategory) {
                CreateCategoryView(flashcardStore: flashcardStore)
            }
        }
    }
} 