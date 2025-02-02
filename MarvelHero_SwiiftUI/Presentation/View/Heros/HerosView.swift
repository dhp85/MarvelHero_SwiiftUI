//
//  HerosView.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 17/12/24.
//

import SwiftUI



struct HerosView: View {
    @State var vm: HerosViewModel
    @State var filter: String = ""

    init (vm: HerosViewModel = HerosViewModel()) {
        self.vm = vm
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Ciudad")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .opacity(0.8)
                
                ScrollView {
                    LazyVStack {
                        ForEach(vm.heros, id: \.id) { hero in
                            NavigationLink {
                                SeriesView(vm: SeriesViewModel(idHero: hero.id))
                               
                            } label: {
                                HerosRowView(hero: hero)
                            }
                            .padding(20)
                            .padding([.leading, .trailing], 40)
                            .transition(.asymmetric(insertion: .move(edge: .bottom).combined(with: .opacity),
                                                    removal: .move(edge: .bottom).combined(with: .opacity)))
                                }
                            }
                    .animation(.easeInOut(duration: 0.5), value: vm.heros.count)
                }
                .navigationTitle("Heroes Marvel")
                .searchable(text: $vm.filterUI, prompt:"Buscar Heroes")
                .onChange(of: vm.filterUI) { oldValue, newValue in
                    withAnimation {
                        if !newValue.isEmpty {
                            Task {
                                try await vm.searchHeros(search: newValue)
                            }
                        } else {
                            Task {
                                try await vm.getHeros()
                            }
                        }
                    }
                }
            }
        }
        .tint(Color.black)
        .onAppear {
                  // Cambiar el estilo de la barra de búsqueda
                  let searchField = UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
                  searchField.backgroundColor = UIColor.white // Fondo blanco
                  searchField.tintColor = UIColor.black // Color del cursor y la selección de texto
              }
    }
}

#Preview {
    HerosView(vm: HerosViewModel(useCase: HerosUseCaseMock()))
}
