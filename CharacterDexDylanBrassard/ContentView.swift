//
//  ContentView.swift
//  CharacterDexDylanBrassard
//
//  Created by macuser on 2023-11-08.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            
        }
        .padding()
        .onAppear(perform: {
            print("Appeared")
            viewModel.loadSuperHero()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
