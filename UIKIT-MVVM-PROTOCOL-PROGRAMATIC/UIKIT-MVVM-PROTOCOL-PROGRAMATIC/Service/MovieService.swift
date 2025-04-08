//
//  MovieService.swift
//  UIKIT-MVVM-PROTOCOL-PROGRAMATIC
//
//  Created by Berk Canpolat on 7.04.2025.
//

import Foundation

class MovieService {
    
    func downloadMovies(completion: @escaping ([MovieResult]?) -> Void) {
        guard let url = URL(string: APIURLs.movies(page: 1)) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                let mov = self.handleWithData(data)
                completion(mov)
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    private func handleWithError(_ error:Error) {
        print(error.localizedDescription)
    }
    
    private func handleWithData(_ data: Data) -> [MovieResult]? {
        do {
            let movie = try JSONDecoder().decode(Movie.self, from: data)
            return movie.results
        } catch {
            print(error)
            return nil
        }
    }
}
