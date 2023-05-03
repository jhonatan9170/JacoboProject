//
//  NetworkingProvider.swift
//  YakoPlanet
//
//  Created by Jacobo Ramirez on 22/04/23.
//

import Foundation
import Alamofire

struct NetworkingProvider{
    
    
    private let kBaseURL = "https://api.themoviedb.org/3/movie/popular?api_key="
    private let kConstanteOk = 200...299
    private let kApiKey = "176de15e8c8523a92ff640f432966c9c"
    
    
//success: @escaping (_ movie: Movie) -> (), failure: @escaping (_ error: Error?) -> ()
    func getAllMovies(success: @escaping (_ arrayMovieDTO: [MovieDTO]) -> (), failure: @escaping (_ error: Error?) -> ()){
        
        let urlService = kBaseURL + kApiKey
        let requestGetAll = AF.request(urlService, method: .get)
        
        requestGetAll.validate(statusCode: kConstanteOk).response
            {response in
                        
            guard let data = response.data else {
                print("Ocurrio un error con el API")
                //success([])
                return
            }
            
            let decoder = JSONDecoder()
            let pageMovies = try? decoder.decode(PageMovieDTO.self, from: data)
                success(pageMovies?.results ?? [])
                
        }
    }
}


