//
//  ApiCallService.swift
//  CharacterDexDylanBrassard
//
//  Created by macuser on 2023-11-08.
//

import Foundation


class ApiCallService{
    func fetchAll(completion:@escaping ( [Superhero]?) -> Void){
        fetchData(url: "https://akabab.github.io/superhero-api/api/all.json", model: [Superhero].self){
            data in
            print("In fetch data")
            print(data)
            let superheroes: [Superhero] = data
            print(superheroes)
            completion(superheroes)
        } failure: {error in
            print(error)
            
        }
    }
    
    
    func fetchData<T: Decodable>(url: String, model: T.Type, completion:@escaping(T)
                                 -> (), failure:@escaping(Error) -> ()) {
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                if let error = error {
                    failure(error)
                }
                return
            }
            do {
                let serverData = try JSONDecoder().decode(T.self, from: data)
                completion(serverData)
            } catch {
                failure(error)
            }
        }
        .resume()
    }

}
