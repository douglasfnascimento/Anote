//
//  EditNoteView.swift
//  Anote
//
//  Created by Douglas Nascimento on 30/09/23.
//

import SwiftUI

struct EditNoteView: View {
    @EnvironmentObject var notes: Notes
    @State var note: Note
    @State var isShowingAlert = false
    @Environment(\.dismiss) var dismiss
    @State var editedTitle: String
    @State var editedContent: String
    
    func validate() -> Bool {
        if editedTitle != "" && editedContent != "" {
            return true
        } else {
            return false
        }
    }
    
    func validateEdition() -> Bool {
        if editedTitle != note.title || editedContent != note.content {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        
        
        NavigationStack {
            VStack {
                
                TextEditor(text: $editedTitle)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(height: 50, alignment: .center)
                Divider()
                TextEditor(text: $editedContent)
                    .font(.body)
                    .frame(maxHeight:.infinity)
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancelar") {
                    isShowingAlert = true
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Salvar") {
                    if validate() && validateEdition() {
                        if let index = notes.notes.firstIndex(where: { $0.id == note.id }) {
                            notes.notes[index].title = editedTitle
                            notes.notes[index].content = editedContent
                            dismiss()
                        }
                    }
                } .opacity(validate() ? 1.0 : 0.0)

            }
        }
        .alert(isPresented: $isShowingAlert) {
            Alert (
                title: Text("Cancelar"),
                message: Text("Deseja mesmo cancelar a edição?"),
                primaryButton: .default(Text("Voltar")),
                secondaryButton: .cancel(Text("Sim")){
                    dismiss()
                }

            )
        }
    }
}
