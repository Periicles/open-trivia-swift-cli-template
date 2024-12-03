/**
 * Filename: /Users/paul/Efrei/open-trivia-swift-cli-template/Sources/opentrivia/data/TriviaRepository.swift
 * Path: /Users/paul/Efrei/open-trivia-swift-cli-template/Sources/opentrivia/data
 * Created Date: Tuesday, December 3rd 2024, 7:24:33 pm
 * Author: Paul Ragueneau
 */

import Foundation


class OpenTriviaRepository: TriviaRepository {
    private let api: OpenTriviaAPI

    init(api: OpenTriviaAPI) {
        self.api = api
    }

    func getTriviaQuestions(
			completion: @escaping (Result<[TriviaQuestion], Error>) -> Void) {
        guard let url = URL(
			string: "https://opentdb.com/api.php?amount=10"
			) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {
				[weak self] data, response, error in
            guard self != nil else {
				return
				}
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            do {
                let apiResponse = try JSONDecoder()
					.decode(TriviaAPIResponse.self, from: data)
                let questions = apiResponse.results.map { apiQuestion in
                    TriviaQuestion(
                        category: apiQuestion.category,
                        difficulty: apiQuestion.difficulty,
                        question: apiQuestion.question,
                        correctAnswer: apiQuestion.correct_answer,
                        incorrectAnswers: apiQuestion.incorrect_answers
                    )
                }
                completion(.success(questions))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}


