import Foundation

struct Flashcard: Identifiable, Codable {
    let id = UUID()  // Unique identifier for each flashcard
    var question: String
    var answer: String
    var category: Category
} 