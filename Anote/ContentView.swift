//
//  ContentView.swift
//  Anote
//
//  Created by Douglas Nascimento on 28/09/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var notes : Notes
    var body: some View {
                TabView {
                    
                    HomeView().environmentObject(notes)
                        .tabItem {
                            Label("Notas", systemImage: "note.text")
                        }
                    Text("Em construção")
                        .tabItem {
                            Label("Arquivo", systemImage: "archivebox")
                        }
                    Text("Em construção")
                        .tabItem {
                            Label("Categorias", systemImage: "list.bullet.rectangle")
                        }
                    Text("Em construção")
                        .tabItem {
                            Label("Configurações", systemImage: "gear")
                        }
                }
                .environmentObject(notes)
            
        }

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Notes())
    }
}

