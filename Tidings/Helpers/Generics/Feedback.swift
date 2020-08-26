//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Combine

struct Feedback<State, Event> {
	let run: (AnyPublisher<State, Never>) -> AnyPublisher<Event, Never>
}

extension Feedback {
	init<Effect: Publisher>(
		effects: @escaping (State) -> Effect
	) where Effect.Output == Event, Effect.Failure == Never {
		self.run = { state -> AnyPublisher<Event, Never> in
			state
				.map { effects($0) }
				.switchToLatest()
				.eraseToAnyPublisher()
		}
	}

	static func userInput<State, Event>(
		input: AnyPublisher<Event, Never>
	) -> Feedback<State, Event> {
		Feedback<State, Event> { _ in input }
	}
}
