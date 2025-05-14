//
//  NotesView.swift
//  MealFitApp
//
//  Created by Viki on 14-05-25.
//

import SwiftUI

struct NotesView: View {
    @ObservedObject var coordinator: MealCoordinator
    @ObservedObject var viewModel: MealViewModel
    @State private var isAddingNote = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Agregar Notas")
                    .font(.largeTitle)
                    .bold()
                Spacer()
                Button {
                    isAddingNote.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                }
            }
            
            if isAddingNote {
                VStack(alignment: .leading) {
                    TextEditor(text: $viewModel.newNote)
                        .frame(height: 100)
                        .padding(8)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                    
                    VStack(alignment: .center) {
                        Button("Guardar nota") {
                            viewModel.addNote()
                            isAddingNote = false
                        }
                    }
                    .padding(.top, 8)
                }
            }
            
            if viewModel.notes.isEmpty {
                Text("Aún no has agregado notas.")
                    .foregroundColor(.secondary)
            } else {
                List {
                    ForEach(viewModel.notes.indices, id: \.self) { index in
                        HStack {
                            Text(viewModel.notes[index])
                                .padding(.vertical, 4)
                            
                            Spacer()
                            
                            Button {
                                viewModel.deleteNote(at: IndexSet(integer: index))
                            } label: {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                }
            }
            
            Spacer()
        }
        .padding()
    }
}
