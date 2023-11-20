//
//  TodoView.swift
//  todoList
//
//  Created by elite on 20/11/2023.
//

import SwiftUI

/*struct TodoView: View {
    @State private var todoStore : [String] = []
 @State private var newTodo = ""

 var body: some View {
     NavigationView {
         Form {
             TextField("New Todo", text: $newTodo)
             Button(action: addTodo) {
               Text("Add Todo")
             }
         }
         List(todoStore) { todo in
             Text(todo.title)
         }
     }
 }
    
    

 func addTodo() {
     if !newTodo.isEmpty {
         todoStore.append(title: newTodo)
         newTodo = ""
     }
 }
}



struct TodoView_Previews: PreviewProvider {
 static var previews: some View {
     TodoView()
 }
}*/


class TodoStore: ObservableObject {
 @Published var todos = [TodoItem]()
}

struct TodoView: View {
   @State private var todoStore = TodoStore()
   @State private var newTodo = ""

   var body: some View {
       NavigationView {
           Form {
               TextField("New Todo", text: $newTodo)
               Button(action: addTodo) {
                  Text("Add Todo")
               }
           }
           List(todoStore.todos) { todo in
               Text(todo.title)
           }
       }
   }

   func addTodo() {
       if !newTodo.isEmpty {
           todoStore.todos.append(TodoItem(title: newTodo))
           newTodo = ""
       }
   }
}

struct TodoItem: Identifiable {
   let id = UUID()
   var title: String
}

struct TodoView_Previews: PreviewProvider {
   static var previews: some View {
       TodoView()
   }
}

struct TodoListView: View {

    @State private var todoItems: [String] = []
    @State private var newItem: String = ""

    var body: some View {
        VStack {

            TextField("Add a new todo item", text: $newItem)
                .padding()

            Button("Add") {
                addTodoItem()
            }
            .padding()

            List {
                ForEach(todoItems, id: \.self) { item in
                    Text(item)
                }
                
            }
        }
        .padding()
 
    }

    private func addTodoItem() {
        guard !newItem.isEmpty else { return }
        todoItems.append(newItem)
        newItem = ""
    }

    private func deleteTodoItem(at offsets: IndexSet) {
        todoItems.remove(atOffsets: offsets)
    }
}

