//
//  SeriesView.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 19/12/24.
//

import SwiftUI

struct SeriesView: View {
    
    @State var vm: SeriesViewModel
    
    var body: some View {
        ZStack {
            //Imagen de fondo.
            Image("Comics Marvel")
                .resizable()
                .ignoresSafeArea()
                .opacity(0.6)
            VStack {
                // Título principal para la lista
                Text("Series Heroe")
                    .background(Color.white.opacity(0.8))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(20)
                
                List {
                    ForEach(vm.seriesList) { series in
                        Section {
                            VStack {
                                Text(series.title)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(.bottom, 8)
                                
                                // Imagen con manejo de estados
                                AsyncImage(url: series.imageUrl) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                            .frame(width: 300, height: 400)
                                            .background(Color.gray.opacity(0.2))
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        
                                    case .success(let image):
                                        // Imagen cargada correctamente
                                        image
                                            .resizable()
                                            .frame(width: 300, height: 400)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.black, lineWidth: 4)
                                            )
                                            .padding()
                                        
                                    case .failure:
                                        // Imagen no disponible
                                        VStack {
                                            Image(systemName: "photo")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 100, height: 100)
                                                .foregroundColor(.gray)
                                            Text("Image not available")
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                        }
                                        .frame(width: 300, height: 400)
                                        .background(Color.gray.opacity(0.2))
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                
                                // Descripción
                                VStack {
                                    Text("Description")
                                        .fontWeight(.bold)
                                        .font(.system(size: 20))
                                    
                                    if let description = series.description {
                                        Text(description)
                                            .font(.system(size: 18))
                                    } else {
                                        Text("No description available.")
                                            .font(.system(size: 18))
                                    }
                                }
                                
                            }
                            .padding(.vertical, 15)
                            .background(Color.orange.opacity(0.3))
                            .cornerRadius(20)
                        }
                        
                    }
                    
                }
                .scrollContentBackground(.hidden)// Estilo de lista más moderno.
            }
        }
    }
}
#Preview {
    SeriesView(vm: SeriesViewModel(idHero: 1, useCase: SeriesUseCaseMock())) 
}
