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
        List {
            VStack {
                ForEach(vm.seriesList) { series in
                    Text(series.title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    AsyncImage(url: series.imageUrl) {photo in
                        photo
                            .image?.resizable()
                            .frame(width: 300, height: 400)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(style: StrokeStyle(lineWidth: 4)))
                            
                    }
                }
            }
         
        }
    }
}

#Preview {
    SeriesView(vm: SeriesViewModel(idHero: 1, useCase: SeriesUseCaseMock())) 
}
