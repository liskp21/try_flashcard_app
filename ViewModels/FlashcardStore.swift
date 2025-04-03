import Foundation
import SwiftUI

class FlashcardStore: ObservableObject {
    @Published var flashcards: [Flashcard] = []
    @Published var categories: [Category] = [
        Category(name: "General"), // Default category
        Category(name: "Math"),
        Category(name: "Science")
    ]
    private let saveKey = "SavedFlashcards"
    private let categoriesKey = "SavedCategories"
    
    init() {
        print("FlashcardStore initialized")
        loadFlashcards()
        loadCategories()
    }
    
    func addFlashcard(question: String, answer: String, category: Category) {
        let newFlashcard = Flashcard(question: question, answer: answer, category: category)
        flashcards.append(newFlashcard)
        saveFlashcards()
    }
    
    func addCategory(name: String) {
        let newCategory = Category(name: name)
        categories.append(newCategory)
        saveCategories()
    }
    
    func deleteFlashcard(at indexSet: IndexSet) {
        flashcards.remove(atOffsets: indexSet)
        saveFlashcards()
    }
    
    private func saveFlashcards() {
        if let encoded = try? JSONEncoder().encode(flashcards) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    private func loadFlashcards() {
        print("Loading flashcards...")
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            print("Data found in UserDefaults")
            if let decoded = try? JSONDecoder().decode([Flashcard].self, from: data) {
                print("Successfully decoded flashcards")
                flashcards = decoded
            } else {
                print("Failed to decode flashcards")
            }
        } else {
            print("No data found in UserDefaults")
        }
    }
    
    private func saveCategories() {
        if let encoded = try? JSONEncoder().encode(categories) {
            UserDefaults.standard.set(encoded, forKey: categoriesKey)
        }
    }
    
    private func loadCategories() {
        if let data = UserDefaults.standard.data(forKey: categoriesKey) {
            if let decoded = try? JSONDecoder().decode([Category].self, from: data) {
                categories = decoded
            }
        }
    }
} 