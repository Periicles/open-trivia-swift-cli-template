/**
 * Filename: /Users/paul/Efrei/open-trivia-swift-cli-template/Sources/opentrivia/use-case/TriviaUseCase.swift
 * Path: /Users/paul/Efrei/open-trivia-swift-cli-template/Sources/opentrivia/use-case
 * Created Date: Tuesday, December 3rd 2024, 7:25:14 pm
 * Author: Paul Ragueneau
 */

class GetTriviaUseCase {
    private let repository: TriviaRepository

    init(repository: TriviaRepository) {
        self.repository = repository
    }

    func execute(
		completion: @escaping (Result<[TriviaQuestion], Error>) -> Void) {
        	repository.getTriviaQuestions(completion: completion)
    }
}
