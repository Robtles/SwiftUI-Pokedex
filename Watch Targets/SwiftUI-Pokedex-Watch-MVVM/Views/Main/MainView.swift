//
//  MainView.swift
//  SwiftUI-Pokedex-Watch-MV Watch App
//
//  Created by Rob on 03/01/2024.
//

import API
import Error
import Model
import SwiftUI
import UI
import WatchAPI

// MARK: - Main View
struct MainView: View {
    // MARK: Environment Properties
    /// The app model, containing shared data
    @Environment(AppModel.self) private var appModel
    
    // MARK: State Properties
    /// If the view is in a loading state
    @State private var viewModel = MainViewModel()
    
    // MARK: View Properties
    var body: some View {
        ZStack {
            if viewModel.loading {
                LoadingView()
                    .task {
                        do {
                            try await viewModel.loadData()
                        } catch {}
                    }
            } else {
                PokedexNavigationView(
                    pokemons: viewModel.pokemons
                )
            }
        }
        .onAppear {
            viewModel.setup(appModel)
        }
    }
}

struct MainViewPreview: PreviewProvider {
    @State private static var appModel = AppModel()
    
    static var previews: some View {
        MainView()
            .environment(appModel)
            .environment(ErrorManager.shared)
    }
}
