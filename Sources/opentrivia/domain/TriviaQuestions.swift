/**
 * Filename: /Users/paul/Efrei/open-trivia-swift-cli-template/Sources/opentrivia/domain/TriviaQuestions.swift
 * Path: /Users/paul/Efrei/open-trivia-swift-cli-template/Sources/opentrivia/domain
 * Created Date: Tuesday, December 3rd 2024, 7:24:15 pm
 * Author: Paul Ragueneau
 */

struct TriviaQuestion {
    let category: String
    let difficulty: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
}
