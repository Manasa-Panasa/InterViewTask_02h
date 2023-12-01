//
//  apicalling.swift
//  InterviewTask_Manasa
//
//  Created by Manasa Panasa on 30/11/23.
//

import Foundation


enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingError(Error)
}

func getUrl<T: Codable>(urlString: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
    guard let url = URL(string: urlString) else {
        completion(.failure(.invalidURL))
        return
    }
    var urlReq = URLRequest(url: url)
    urlReq.httpMethod = "GET"
    let task = URLSession.shared.dataTask(with: urlReq) { data, response, error in
        if let error = error {
            completion(.failure(.requestFailed(error)))
            return
        }
        guard let data = data else {
            completion(.failure(.invalidResponse))
            return
        }
        do {
            let decodedObject = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodedObject))
        } catch let decodingError {
            completion(.failure(.decodingError(decodingError)))
        }
    }
    task.resume()
}


