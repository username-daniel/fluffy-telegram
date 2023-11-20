//
//  Signup.swift
//  todoList
//
//  Created by elite on 20/11/2023.
//

import SwiftUI

struct Signup: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}



struct SignUpView: View {
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
               print("Signed up!")
           }){
               Text("Sign up")
           }
           .disabled(email.isEmpty || password.isEmpty)
           
           Spacer()
       }
   }
}




struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}



