import SwiftUI

struct NewNoteView: View {
    @EnvironmentObject var notes : Notes
    @Environment(\.dismiss) var dismiss
    
    @State var newNote: Note = Note(title: "", content: "")

    @State var selectedCategory: Category = .personal
    
    
    func validate() -> Bool {
        if newNote.title != "" && newNote.content != "" {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        NavigationStack {
            //VStack {
                List {
                    TextField("Título", text: $newNote.title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Picker("Categoria", selection: $selectedCategory) {
                        Text("Pessoal").tag(Category.personal)
                        Text("Estudos").tag(Category.school)
                        Text("Trabalho").tag(Category.work)
                    }
                    
                    TextEditor(text: $newNote.content)
                    Spacer()

                }
                .scrollContentBackground(.hidden)

        }

        .toolbar {
            ToolbarItem {
                Button("Salvar") {
                    if validate() {
                        newNote.category = selectedCategory
                        newNote.date = Date()
                        notes.notes.append(newNote)
                        dismiss()
                    }
                }
                .opacity(validate() ? 1.0 : 0.0)
            }
        }

    }
}

#Preview {
    NewNoteView()
        .environmentObject(Notes())
}
