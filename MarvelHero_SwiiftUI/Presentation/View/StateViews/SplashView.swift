//
//  LoaderView.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 26/1/25.
//

import SwiftUI

struct SplashView: View {
    
    @State private var isAnimatingLogo = false
    @State private var isAnimatingSpinner = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                Image("Ciudad")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.7) 
                
                VStack {
                    Spacer()
                    
                    // Logo con animación de escala
                    Image("LogoMarvel")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.5)
                        .padding(.bottom, 30)
                        .scaleEffect(isAnimatingLogo ? 1.1 : 1)
                        .opacity(isAnimatingLogo ? 1 : 0)
                        .animation(.easeIn(duration: 1), value: isAnimatingLogo)
                    
                    Spacer()
                    
                    // Spinner animado
                    ZStack {
                        Circle()
                            .stroke(Color.white.opacity(0.3), lineWidth: 10)
                            .frame(width: 80, height: 80)
                        
                        Circle()
                            .trim(from: 0.0, to: 0.8)
                            .stroke(Color.white, lineWidth: 8)
                            .frame(width: 80, height: 80)
                            .rotationEffect(Angle(degrees: isAnimatingSpinner ? 360 : 0))
                            .animation(
                                Animation.linear(duration: 1.5)
                                    .repeatForever(autoreverses: false),
                                value: isAnimatingSpinner
                            )
                    }
                    .onAppear {
                        isAnimatingLogo = true
                        isAnimatingSpinner = true
                    }
                    .padding(.bottom, 30)
                   }
            }
        }
    }
}
#Preview {
    SplashView()
}
