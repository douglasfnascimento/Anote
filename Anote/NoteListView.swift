

import Foundation
import SwiftUI

struct NoteListView: View {
    var note: Note
    
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
    
    var body: some View {
        HStack {
            VStack{
                HStack {
                    Text(note.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .padding(.bottom, -8.0)
                        
                    Spacer()
                    Button(note.category.rawValue) {
                        
                    }
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                    .padding(.horizontal, 6.0)
                    .padding(.vertical, 3.0)
                    .background(getButtonColor(for: note.category))
                    .cornerRadius(5)
                    

                    
                    
                }
                HStack {
                    Text(note.content)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2) // Limitar a duas linhas
                        .frame(minHeight: 50, alignment: .leading)
                    Spacer()
                }

            }

        }
    }
}

struct NoteListView_Previews: PreviewProvider {
    static var previews: some View {
        NoteListView(note: Note(title: "Kuuh", content: "this application, or a library it uses, has passed an invalid numeric value (NaN, or not-a-number) to CoreGraphics API and this value is being ignored. Please fix this problem..", date: Date(), category: .work))
    }
}
