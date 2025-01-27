//
//  ErrorView.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 26/1/25.
//

import SwiftUI

struct ErrorView: View {
    
    @Environment(HerosViewModel.self) var status
    
    private var textError: String
    
    init(textError: String) {
        self.textError = textError
    }
    
    var body: some View {
        VStack {
            
            Text("Oh, Fuck!")
                .font(.title)
            
            Image("DeadPool")
                .resizable()
                .frame(width: 300, height: 350)
                
            Text(textError)
                .font(.headline)
                .padding()
            Button {
                status.status = .none
            } label: {
                Text("Reintentar")
            }
            .padding()
            .background(Color.blue)
            .foregroundStyle(.white)
            .font(.headline)
            .clipShape(Capsule())
            .shadow(radius: 5, x: 0, y: 5)
        }
    }
}

#Preview {
    ErrorView(textError: "Error de Conexión")
        .environment(HerosViewModel())
}
