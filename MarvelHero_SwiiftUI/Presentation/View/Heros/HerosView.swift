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
                        }
                    }
                }
                .navigationTitle("Heroes Marvel")
            }
        }
        .tint(Color.black)
    }
}

#Preview {
    HerosView(vm: HerosViewModel(useCase: HerosUseCaseMock()))
}
