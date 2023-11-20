//
//  CreateView.swift
//  todoList
//
//  Created by elite on 20/11/2023.
//

/*import SwiftUI

struct CreateView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack() {
            Text("Create an account")
            
            TextField("Email", text: $email)
            
            SecureField("Password", text: $password)
            
            Button(action: {
                UserDefaults.standard.set(email, forKey: "Email")
                UserDefaults.standard.set(password, forKey: "Password")
                NavigationLink(LogView())
            }){
                Text("Sign up")
            }
            .disabled(email.isEmpty || password.isEmpty)
            
            Spacer()
        }
    }
}*/

/*import SwiftUI

struct CreateView: View {
   @State private var email: String = ""
   @State private var password: String = ""
   @State private var navigateToLogView = false
   
   var body: some View {
       NavigationView {
           VStack() {
               Text("Create an account")
               
               TextField("Email", text: $email)
               
               SecureField("Password", text: $password)
               
               NavigationLink(destination: LogView(), isActive: $navigateToLogView) {
                  Button(action: {
                      UserDefaults.standard.set(email, forKey: "Email")
                      UserDefaults.standard.set(password, forKey: "Password")
                      print("Signed up!")
                      navigateToLogView = true
                  }){
                      Text("Sign up")
                  }
                  .disabled(email.isEmpty || password.isEmpty)
               }
               
               Spacer()
           }
       }
   }
}*/


import SwiftUI

struct CreateView: View {
  @State private var email: String = ""
  @State private var password: String = ""
  @State private var navigateToLogView = false
  
  var body: some View {
      NavigationView {
          VStack() {
              Text("Create an account")
              
              TextField("Email", text: $email)
              
              SecureField("Password", text: $password)
              
              NavigationLink(isActive: $navigateToLogView) {
                LogView()
              } label: {
                Button(action: {
                    UserDefaults.standard.set(email, forKey: "Email")
                    UserDefaults.standard.set(password, forKey: "Password")
                    print("Signed up!")
                    navigateToLogView = true
                }){
                    Text("Sign up")
                }
                .disabled(email.isEmpty || password.isEmpty)
              }
              
              Spacer()
          }
      }
  }
}


struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}



