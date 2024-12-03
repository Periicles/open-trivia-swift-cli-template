/**
 * Filename: /Users/paul/Efrei/open-trivia-swift-cli-template/Sources/opentrivia/presentation/TriviaCLI.swift
 * Path: /Users/paul/Efrei/open-trivia-swift-cli-template/Sources/opentrivia/presentation
 * Created Date: Tuesday, December 3rd 2024, 7:25:44 pm
 * Author: Paul Ragueneau
 */

import Foundation

class TriviaCLI {
    private let getTriviaUseCase: GetTriviaUseCase

    init(getTriviaUseCase: GetTriviaUseCase) {
        self.getTriviaUseCase = getTriviaUseCase
    }

    func start() {
        getTriviaUseCase.execute { result in
            switch result {
            case .success(let questions):
                self.runTriviaGame(with: questions)
            case .failure(let error):
				print("Failed to fetch trivia questions: "
					  + "\(error.localizedDescription)")
                exit(EXIT_FAILURE)
            }
        }
    }

    private func runTriviaGame(with questions: [TriviaQuestion]) {
        var score: Int = 0

        for (index, question) in questions.enumerated() {
            print("\n ❓ Question \(index + 1):")
            print(question.question)

            var answers = question.incorrectAnswers
				+ [question.correctAnswer]
            answers.shuffle()

            for (i, answer) in answers.enumerated() {
                print("\(i + 1). \(answer)")
            }

            var userAnswer: Int?
            repeat {
                print("What is your answer: \n", terminator: "")
                if let input = readLine(),
					let number = Int(input),
					number > 0,
					number <= answers.count {
                    userAnswer = number
                } else {
                    print("Your cannot ask for this. Please enter a "
						+ "number between 1 and \(answers.count).")
                }
            } while userAnswer == nil

            if answers[userAnswer! - 1] == question.correctAnswer {
                print("✅ Correct!")
                score += 1
            } else {
                print("🧨 Incorrect. The correct answer was:"
					+ " \(question.correctAnswer)")
            }
        }
		if score == questions.count {
			print ("\n Oh wonderful! You got all the questions right!")
		} else {
        	print("\nGame Over!\nScore: \(score)/\(questions.count)")
		}
        exit(EXIT_SUCCESS)
    }
}
