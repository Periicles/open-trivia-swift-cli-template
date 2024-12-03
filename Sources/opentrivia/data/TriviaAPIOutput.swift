/**
 * Filename: /Users/paul/Efrei/open-trivia-swift-cli-template/Sources/opentrivia/data/TriviaAPIOutput.swift
 * Path: /Users/paul/Efrei/open-trivia-swift-cli-template/Sources/opentrivia/data
 * Created Date: Tuesday, December 3rd 2024, 7:23:24 pm
 * Author: Paul Ragueneau
 */

struct TriviaAPIResponse: Codable {
    let results: [TriviaAPIQuestion]
}

struct TriviaAPIQuestion: Codable {
    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
}
