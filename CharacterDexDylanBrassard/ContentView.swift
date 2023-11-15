//
//  ContentView.swift
//  CharacterDexDylanBrassard
//
//  Created by macuser on 2023-11-08.
//

import SwiftUI


class ImageLoader: ObservableObject {
    @Published var image: UIImage?

    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let uiImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = uiImage
                    }
                }
            }
        }
    }
}

struct heroDetail: View {
    @State var superhero: Superhero
    var body: some View {
        VStack{
            List{
                AsyncImage(url: URL(string: superhero.images.lg))
                Text("ID : \(superhero.id)")
                Text("Name : \(superhero.name)")
                Text("Slug : \(superhero.slug)")
            }
        }
    }
}

struct ContentView: View {
    @StateObject var viewModel = ViewModel()


    var body: some View {
        VStack {
            if(viewModel.superheroes.count <= 0){
                Text("LOADING...")
            }else{
                NavigationView{
                    
                    List{
                        ForEach(viewModel.superheroes){
                            superhero in
                            NavigationLink(destination: heroDetail(superhero: superhero)){
                                
                                HStack{
                                    AsyncImage(url: URL(string: superhero.images.sm))
                                    
                                    Text("\(superhero.name)").padding()
                                    
                                }
                            }
                            
                        }
                    }
                }
            }
        }
    .padding()
        .onAppear(perform: {
            print("Appeared")
            viewModel.loadSuperHero()
        })
    }
}
