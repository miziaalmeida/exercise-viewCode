import UIKit
import Alamofire

enum ServicePath {
    static let products = "/produtos"
}

enum ServiceError: Error {
    case invalidData
    case invalidURL
    case parse
    case unknown(Error)
}

protocol ServiceProtocol {
    func getData(url: URL, completion: @escaping (Result<Data, ServiceError>) -> Void)
}

class APIService {
    private let baseUrl = "https://private-8f4dda-testeabi.apiary-mock.com"

    func getData(path: String, completion: @escaping (Result<Data, ServiceError>) -> Void) {
        guard let url = URL(string: baseUrl + path) else {
            completion(.failure(.invalidURL))
            return
            
        }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(.unknown(error)))
                }
            }
            
            guard let jsonData = data else {
                DispatchQueue.main.async {
                    completion(.failure(.invalidData))
                }
                return
            }
            DispatchQueue.main.async {
                completion(.success(jsonData))
            }
        }.resume()
    }
}

