/**
 * Filename: /Users/paul/Efrei/open-trivia-swift-cli-template/Sources/opentrivia/data/TriviaAPI.swift
 * Path: /Users/paul/Efrei/open-trivia-swift-cli-template/Sources/opentrivia/data
 * Created Date: Tuesday, December 3rd 2024, 7:23:06 pm
 * Author: Paul Ragueneau
 */

import Foundation

class OpenTriviaAPI {
    func fetchTriviaQuestions(completion: @escaping (Result<TriviaAPIResponse, Error>) -> Void) {
        let urlString = "https://opentdb.com/api.php?amount=10"
        guard let url = URL(string: urlString) else {
            completion(
				.failure(
					NSError(
						domain: "Invalid URL", code: 1, userInfo: nil
					)
				)
			)
            return
        }
        let task = URLSession.shared
			.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(
					.failure(
						NSError(
							domain: "No data received", code: 2, userInfo: nil
						)
					)
				)
                return
            }
            do {
                let decoder = JSONDecoder()
                let response = try decoder
					.decode(TriviaAPIResponse.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
