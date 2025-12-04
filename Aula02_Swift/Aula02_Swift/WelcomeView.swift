//
//  WelcomeView.swift
//  Aula02_Swift
//
//  Created by user288578 on 12/3/25.
//

import SwiftUI

// 1. Nova View de Destino
// Esta é a tela que será exibida após o login bem-sucedido
struct WelcomeView: View {
    var username: String
    
    var body: some View {
        VStack {
            Image(systemName: "hand.wave.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.blue)
                .padding()
            Text("Bem-vindo(a), \(username)!")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .navigationTitle("Início")
    }
}
