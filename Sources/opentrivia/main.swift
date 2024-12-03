// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

// MARK: - Dispatch

// NB: Replace the `DispatchQueue.main.asyncAfter` with your code.
// Once the program is done, call `exit(EXIT_SUCCESS)` to exit the program.
let api = OpenTriviaAPI()
let repository = OpenTriviaRepository(api: api)
let useCase = GetTriviaUseCase(repository: repository)
let cli = TriviaCLI(getTriviaUseCase: useCase)

DispatchQueue.main.async {
    cli.start()
}

dispatchMain()
