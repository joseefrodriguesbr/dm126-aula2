			
//
//  ContentView.swift
//  Aula02_Swift
//
//  Created by user288578 on 12/3/25.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var alertMessage: String = ""
    @State private var showAlert: Bool = false
    
    // Estado para controlar a navegação
    @State private var isLoggedIn: Bool = false
    
    var body: some View {

        NavigationStack {
            VStack(spacing: 25) {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.blue)
                
                
                HStack {
                    Image(systemName: "person.circle.fill")
                        .foregroundColor(.gray)
                    TextField("Nome de Usuário", text: $username)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )

                
                HStack {
                    Image(systemName: "lock.fill")
                        .foregroundColor(.gray)
                    SecureField("Senha", text: $password)
                        .textContentType(.password)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )

                
                Button(action: handleLogin) {
                    HStack {
                        Image(systemName: "arrow.right.circle.fill")
                        Text("ENTRAR")
                            .fontWeight(.semibold)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }

                // O destino só será ativado quando 'isLoggedIn' for true.
                NavigationLink(
                    destination: WelcomeView(username: username),
                    isActive: $isLoggedIn
                ) {
                    EmptyView()
                }
            }
            .padding(.horizontal, 40)
            .alert(alertMessage, isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            }
        }
    }
    
    private func handleLogin() {
        if username == "Admin" && password == "123" {
            isLoggedIn = true
        } else {
            alertMessage = "Credenciais inválidas. Tente novamente."
            showAlert = true
        }
    }
}

#Preview {
    ContentView()
}
