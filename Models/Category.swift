import Foundation

struct Category: Identifiable, Codable, Hashable {
    let id = UUID()
    var name: String
} 