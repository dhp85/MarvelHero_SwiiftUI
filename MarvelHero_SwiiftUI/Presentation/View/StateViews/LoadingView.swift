//
//  LoadingView.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 27/1/25.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            // Fondo de la ciudad
            Image("Ciudad")
                .resizable()
                .ignoresSafeArea(.all)
                .opacity(0.8)
            
            VStack {
                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.3), lineWidth: 10)
                        .frame(width: 80, height: 80)
                    
                    Circle()
                        .trim(from: 0.0, to: 0.8) // Solo una parte del círculo
                        .stroke(Color.white, lineWidth: 8)
                        .frame(width: 80, height: 80)
                        .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                        .animation(
                            Animation.linear(duration: 1.0)
                                .repeatForever(autoreverses: false),
                            value: isAnimating
                        )
                }
                .onAppear {
                    isAnimating = true
                }
                
                // Texto opcional debajo del spinner
                Text("Cargando...")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.top, 20)
                    .padding(.bottom, 40) // Deja un espacio adicional en la parte inferior
            }
        }
    }
}
#Preview {
    LoadingView()
}
