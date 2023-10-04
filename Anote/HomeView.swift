//
//  HomeView.swift
//  Anote
//
//  Created by Douglas Nascimento on 29/09/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var notes : Notes

    var body: some View {
        NavigationView(content: {
            VStack {
                if notes.notes.isEmpty {
                    VStack {
                        Image(systemName: "xmark.seal.fill")
                            .foregroundColor(Color.blue)
                            .font(.system(size: 40))
                        Text("Nenhuma nota")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Adicione sua primeira nota tocando no botão abaixo")
                            
                            .font(.subheadline)
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 50.0)
                        NavigationLink {
                            NewNoteView()
                                .environmentObject(notes)
                        } label: {
                            Label("Nova Nota", systemImage: "note.text.badge.plus")
                        }.padding(.top).buttonStyle(.borderedProminent)
                    }

                }
                else {
                    List {
                        ForEach(notes.notes) { note in
                            NavigationLink {
                                NoteDetailView(note: note)
                                    .environmentObject(notes)
                            } label: {
                                NoteListView(note: note)
                            }
                        }
                        
                    }

                    .toolbar {
                        ToolbarItem {
                            NavigationLink {
                                NewNoteView()
                                    .environmentObject(notes)
                            } label: {
                                Label("Adicionar", systemImage: "square.and.pencil")
                            }
                            
                        }
                    }
                    .scrollContentBackground(.hidden)
                }

            }
        }).environmentObject(notes)

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Notes()) // Fornecer uma instância de Notes como ambiente

    }
}

