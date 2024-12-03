/**
 * Filename: /Users/paul/Efrei/open-trivia-swift-cli-template/Sources/opentrivia/domain/TriviaRepository.swift
 * Path: /Users/paul/Efrei/open-trivia-swift-cli-template/Sources/opentrivia/domain
 * Created Date: Tuesday, December 3rd 2024, 7:24:33 pm
 * Author: Paul Ragueneau
 */

protocol TriviaRepository {
    func getTriviaQuestions(
		completion: @escaping (Result<[TriviaQuestion], Error>) -> Void)
}
