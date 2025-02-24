//
//  NetworkManager.swift
//  challenge_meli_ios
//
//  Created by Mac on 24/02/25.
//
import Foundation

class NetworkManager {
    static let shared = NetworkManager() 

    private let baseURL = "https://api.mercadolibre.com"
    private let session: URLSession

    private init() {
        self.session = URLSession(configuration: .default)
    }

    func fetchData<T: Decodable>(endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)\(endpoint)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }

        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 500, userInfo: nil)))
                return
            }

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

