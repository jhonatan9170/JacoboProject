//
//  NetworkingProvider.swift
//  YakoPlanet
//
//  Created by Jacobo Ramirez on 22/04/23.
//

import Foundation
import Alamofire

protocol NetworkingProviderDelegate: AnyObject {
    func didFetchMovies(_ movies: [MovieDTO])
    func didFail(withError error: Error?)
}

class NetworkingProvider {
    
    weak var delegate: NetworkingProviderDelegate?
    
    private let baseURL = "https://api.themoviedb.org/3/movie/popular?api_key="
    private let constantOk = 200...299
    private let apiKey = "176de15e8c8523a92ff640f432966c9c"
    
    func getAllMovies(){
        let urlService = baseURL + apiKey
        let requestGetAll = AF.request(urlService, method: .get)
        
        requestGetAll.validate(statusCode: constantOk).response { [weak self] response in
            guard let self = self else { return }
            
            switch response.result {
            case .success(let data):
                guard let jsonData = data else {
                    self.delegate?.didFail(withError: nil)
                    return
                }
                
                let decoder = JSONDecoder()
                if let pageMovies = try? decoder.decode(PageMovieDTO.self, from: jsonData) {
                    self.delegate?.didFetchMovies(pageMovies.results ?? [])
                } else {
                    self.delegate?.didFail(withError: nil)
                }
                
            case .failure(let error):
                self.delegate?.didFail(withError: error)
            }
        }
    }
}
