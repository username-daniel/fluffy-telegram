//
//  LoginView.swift
//  todoList
//
//  Created by elite on 20/11/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    /*let isValidData = !email.isEmpty && !password.isEmpty == true

    let isInvalidData = email.isEmpty || password.isEmpty == false*/
    
    
    var body: some View {
        
        VStack() {
            Text("Introduce your credentials")
            
            TextField("Email", text: $email)
            
            SecureField("Password", text: $password)
            
            Button(action: {
                UserDefaults.standard.set(email, forKey: "Email")
                UserDefaults.standard.set(password, forKey: "Password")
                print("Logged in!")
            }){
                Text("Log in")
            }
            .disabled(email.isEmpty || password.isEmpty)
            
            Spacer()
        }
    }
    
    
    

    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
