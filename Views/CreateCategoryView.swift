import SwiftUI

struct CreateCategoryView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var flashcardStore: FlashcardStore
    @State private var categoryName = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Category Name")) {
                    TextField("Enter category name", text: $categoryName)
                }
            }
            .navigationTitle("New Category")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        flashcardStore.addCategory(name: categoryName)
                        presentationMode.wrappedValue.dismiss()
                    }
                    .disabled(categoryName.isEmpty)
                }
            }
        }
    }
} 