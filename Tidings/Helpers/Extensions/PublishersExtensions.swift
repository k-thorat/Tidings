//
// Created by Kiran Thorat.
// Copyright © 2020 Kiran Thorat. All rights reserved.
//

import Combine

extension Publishers {
	static func system<State: Equatable, Event: Equatable, Scheduler: Combine.Scheduler>(
		initial: State,
		reduce: @escaping (State, Event) -> State,
		scheduler: Scheduler,
		feedbacks: [Feedback<State, Event>]
	) -> AnyPublisher<State, Never> {
		let state = CurrentValueSubject<State, Never>(initial)

		let events = feedbacks.map { feedback in feedback.run(state.eraseToAnyPublisher()) }

		return Deferred {
			Publishers.MergeMany(events)
				.receive(on: scheduler)
				.scan(initial, reduce)
				.removeDuplicates()
				.handleEvents(receiveOutput: state.send)
				.receive(on: scheduler)
				.prepend(initial)
				.eraseToAnyPublisher()
		}
		.eraseToAnyPublisher()
	}
}
