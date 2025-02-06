//
//  SeriesView.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 19/12/24.
//

import SwiftUI

struct SeriesView: View {
    @State var vm: SeriesViewModel
    
    init(vm: SeriesViewModel) {
        self.vm = vm
    }
    
    var body: some View {
            switch vm.status {
            case .none:
                Text("Loading...")
                    .onAppear {
                        Task {
                            // Llamamos al método directamente desde vm
                            try await vm.getSeriesHero(idHero: vm.idHero)
                        }
                    }
            case .loading:
                LoadingView()
            case .loaded:
                ZStack {
                    // Imagen de fondo.
                    Image("Comics Marvel")
                        .resizable()
                        .ignoresSafeArea()
                        .opacity(0.6)
                        .blur(radius: 3)
                    VStack {
                        
                        // Título principal para la lista
                        Text("Series Heroe")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding()
                            .background(Color.white.opacity(0.8), in: RoundedRectangle(cornerRadius: 40))
                        
                        List {
                            ForEach(vm.seriesList) { series in
                                SeriesRowView(series: series)
                            }
                            .listRowInsets(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
                            
                        }
                        
                    }
                }
                .scrollContentBackground(.hidden)
                
            case .error(error: let error):
                ErrorView(textError: error)
            }
        }
}


#Preview {
    SeriesView(vm: SeriesViewModel(idHero: 1, useCase: SeriesUseCaseMock()))
}
