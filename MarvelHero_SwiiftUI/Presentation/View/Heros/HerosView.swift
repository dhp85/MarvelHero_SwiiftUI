//
//  HerosView.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 17/12/24.
//

import SwiftUI



struct HerosView: View {
    @State var vm: HerosViewModel

    init (vm: HerosViewModel = HerosViewModel()) {
        self.vm = vm
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(vm.heros, id: \.id) { hero in
                        NavigationLink {
                            SeriesView(vm: SeriesViewModel(idHero: hero.id))
                           // Text("\(hero.id)")
                        } label: {
                            HerosRowView(hero: hero)
                        }
                        .padding(20)
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .navigationTitle("Heroes")
        }
    }
}

#Preview {
    HerosView(vm: HerosViewModel(useCase: HerosUseCaseMock()))
}
