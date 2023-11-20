//
//  LogView.swift
//  todoList
//
//  Created by elite on 20/11/2023.
//

import SwiftUI

/*struct LogView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    //let isValidData = !email.isEmpty && !password.isEmpty
    
    var body: some View {
        VStack() {
            Text("Introduce your credentials")
            
            TextField("Email", text: $email)
            
            SecureField("Password", text: $password)
            
            Button(action: {
                //UserDefaults.standard.set(email, forKey: "Email")
                //UserDefaults.standard.set(password, forKey: "Password")
                
                let storedEmail = UserDefaults.standard.string(forKey: "Email")
                let storedPassword = UserDefaults.standard.string(forKey: "Password")
                print("Logged in!")
            }){
                Text("Log in")
            }
            //.disabled(!isValidData)
            
            Spacer()
        }
    }
}*/




struct LogView: View {
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
                ContentView()
              } label: {
                Button(action: {
                   let storedEmail = UserDefaults.standard.string(forKey: "Email")
                   let storedPassword = UserDefaults.standard.string(forKey: "Password")
                   
                   if email == storedEmail && password == storedPassword {
                       print("Signed up!")
                       navigateToLogView = true
                   } else {
                       print("Invalid credentials.")
                   }
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





struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView()
    }
}
