import SwiftUI

enum Category: String, CaseIterable, Identifiable {
    case personal = "Pessoal"
    case school = "Estudos"
    case work = "Trabalho"
    var id: Self { self }
}
class EnumContainer: ObservableObject {
    @Published var category: Category = .personal
}

@MainActor class Notes: ObservableObject {
    @Published var notes: [Note]
    
    init() {
        self.notes = []
    }
}

struct Note: Identifiable {
    var title: String
    var content: String
    var date: Date = Date()
    var category: Category = .personal
    var id = UUID()
    
    
}

