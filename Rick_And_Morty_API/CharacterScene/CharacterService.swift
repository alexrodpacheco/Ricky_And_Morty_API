import Foundation

enum ServiceError: Error {
    case errorURLSring
    case errorDataTask(Error)
    case dataNotFound
    case decodeError(Error)
}

final class CharacterService {
    
    func fetchHomeData(completionHandler: @escaping (Result <CharacterModel, Error>) -> Void) {
        let urlString = "https://rickandmortyapi.com/api/character"
        
        guard let url = URL(string: urlString) else {
            return completionHandler(.failure(ServiceError.errorURLSring))
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completionHandler(.failure(ServiceError.errorDataTask(error)))
                return
            }
            
            guard let jsonData = data else {
                return completionHandler(.failure(ServiceError.dataNotFound))
            }
            
            do {
                let decoder = JSONDecoder()
                let homeModel = try decoder.decode(CharacterModel.self, from: jsonData)
                completionHandler(.success(homeModel))
            }
            catch {
                completionHandler(.failure(ServiceError.decodeError(error)))
            }
        }
        task.resume()
    }
}
