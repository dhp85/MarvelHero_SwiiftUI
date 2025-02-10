//
//  MarvelHero_SwiftUITestsView.swift
//  MarvelHero_SwiiftUI
//
//  Created by Diego Herreros Parron on 10/2/25.
//

import Testing
import Foundation
import ViewInspector
import SwiftUI

@testable import MarvelHero_SwiiftUI


final class MarvelHero_SwiiftUITestsView {
    @Test
    @MainActor
    func seriesView() throws {
        let useCaseMock = SeriesUseCaseMock()
        let seriesView = SeriesView(vm: SeriesViewModel(idHero: 1, useCase: useCaseMock))
        #expect(seriesView.body != nil)
        
    }
    
    @Test("SeriesView State.none")
    @MainActor
    func testSeriesView_whenStateIsNone() throws {
        let useCaseMock = SeriesUseCaseMock()
        let seriesViewModel = SeriesViewModel(idHero: 1, useCase: useCaseMock)
        seriesViewModel.status = .none
          let view = SeriesView(vm: seriesViewModel)
        let inspectedView = try view.inspect()
        
        print(inspectedView)
        let textView = try inspectedView.find(text: "Loading...")
        try textView.callOnAppear()
        
          
        #expect(try textView.string() == "Loading...")
      }
    
    @Test("SeriesView State.Loading")
    @MainActor
    func testSeriesView_whenStateIsLoading() throws {
        let useCaseMock = SeriesUseCaseMock()
        let vm = SeriesViewModel(idHero: 1, useCase: useCaseMock)
        vm.status = .loading
          let view = SeriesView(vm: vm)
        let inspectedView = try view.inspect()
        let loadingView = try inspectedView.find(LoadingView.self)
        
        #expect(loadingView != nil)
      }
    
    @Test("SeriesView State.Loaded")
    @MainActor
    func testSeriesView_whenStateIsLoaded() async throws {
        let useCaseMock = SeriesUseCaseMock()
        let viewModel = SeriesViewModel(idHero: 1, useCase: useCaseMock)
        
        try await viewModel.getSeriesHero(idHero: 1)
        
        
        try await Task.sleep(nanoseconds: 100_000_000)
        
        let view = SeriesView(vm: viewModel)
        
        let inspectedView = try view.inspect()
          
        let list = try inspectedView.find(ViewType.List.self)
        
        let firstRowText = try list.find(ViewType.Text.self).string()
        #expect(firstRowText == "Avengers: The Initiative(2007-2010)")
          
    }
    
    @Test("SeriesView State.Error")
    @MainActor
    func testSeriesView_whenStateIsError() throws {
        let useCaseMock = SeriesUseCaseMock()
        let vieModelSeries = SeriesViewModel(idHero: 1, useCase: useCaseMock)
         vieModelSeries.status = .error(error: "error")
          
        let view = SeriesView(vm: vieModelSeries)
        let inspectedView = try view.inspect()
        
        let errorView = try inspectedView.find(ErrorView.self)
        
        #expect(errorView != nil)
        
      }
}

