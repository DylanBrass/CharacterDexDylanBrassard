//
//  ViewModel.swift
//  CharacterDexDylanBrassard
//
//  Created by macuser on 2023-11-08.
//

import Foundation

class ViewModel: ObservableObject{
    @Published var superheroes: [Superhero] = []
    
    private var service = ApiCallService()
   
    
    func loadSuperHero(){
        service.fetchAll{
            data in
                self.superheroes = data ?? []
            }
            
            print(superheroes)
        }
    
}
