//
//  NoteView.swift
//  Anote
//
//  Created by Douglas Nascimento on 29/09/23.
//

import SwiftUI



private func getButtonColor(for category: Category) -> Color {
    switch category {
    case .personal:
        return Color.blue
    case .school:
        return Color.green
    case .work:
        return Color.purple
    }
}

struct NoteDetailView: View {
    @EnvironmentObject var notes : Notes
    @Environment(\.dismiss) var dismiss

    var note: Note
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy, HH:mm"
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            List {
                Text(note.title)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                HStack {
                    Text(dateFormatter.string(from: note.date))
                        .font(.footnote)
                    Button(note.category.rawValue) {
                        
                    }
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                    .padding(.horizontal, 6.0)
                    .padding(.vertical, 3.0)
                    .background(getButtonColor(for: note.category))
                    .cornerRadius(5)
                }
                Text(note.content)
            }
            .scrollContentBackground(.hidden)
        }

        .toolbar {
            ToolbarItem {
                NavigationLink("Editar") {
                    EditNoteView(note: note, editedTitle: note.title, editedContent: note.content)
                        .environmentObject(notes)

                }
            }
        }

    }
    
}

#Preview {
    NoteDetailView(note: Note(title: "Essa é uma nota qualquer", content: "Sempre que uma nova geração de iPhones é lançada, são incontáveis os testes que são feitos para atestar a qualidade dos novos aparelhos. Dois dos mais recentes, por exemplo, analisaram a capacidade de recarga dos iPhones 15. Será que a porta USB-C trouxe melhorias messe sentido?\n\nComeçando com o teste do DXOMARK, o qual avaliou uma variedade de cabos da própria Apple e de terceiros ao recarregar os aparelhos. A primeira grande conclusão foi a confirmação de que não há limitações para carregamento usando fontes que não sejam as da Maçã — pelo menos não entre as testadas.\n\nThe Date structure provides methods for comparing dates, calculating the time interval between two dates, and creating a new date from a time interval relative to another date. Use date values in conjunction with DateFormatter instances to create localized representations of dates and times and with Calendar instances to perform calendar arithmetic.", category: .school))

}
