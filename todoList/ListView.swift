//
//  ListView.swift
//  todoList
//
//  Created by elite on 20/11/2023.
//

import SwiftUI

import SwiftUI

struct ListView: View {
    @State private var todoItems: [String] = []
    @State private var newItem: String = ""

    var body: some View {
        VStack {


            TextField("Add a new todo item", text: $newItem)

            Button("Add") {
                addTodoItem()
            }
            .padding()

            List {
                ForEach(todoItems, id: \.self) { item in
                    Text(item)
                }
                .onDelete(perform: deleteTodoItem)
            }
        }
        .padding()
        .onAppear {
                    todoItems = UserDefaults.standard.stringArray(forKey: "todoItems") ?? []
                }
    }

    private func addTodoItem() {
        guard !newItem.isEmpty else { return }
        todoItems.append(newItem)
        newItem = ""

                UserDefaults.standard.set(todoItems, forKey: "todoItems")
    }

    private func deleteTodoItem(at offsets: IndexSet) {
        todoItems.remove(atOffsets: offsets)
        UserDefaults.standard.set(todoItems, forKey: "todoItems")
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
