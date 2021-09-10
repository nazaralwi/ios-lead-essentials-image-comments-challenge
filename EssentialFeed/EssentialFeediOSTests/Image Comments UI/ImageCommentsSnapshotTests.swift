//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import XCTest
import EssentialFeediOS
@testable import EssentialFeed

class ImageCommentsSnapshotTests: XCTestCase {
	func test_listWithComment() {
		let sut = makeSUT()

		sut.display(commentCellControllers())

		assert(snapshot: sut.snapshot(for: .iPhone8(style: .light)), named: "IMAGE_COMMENTS_light")
		assert(snapshot: sut.snapshot(for: .iPhone8(style: .dark)), named: "IMAGE_COMMENTS_dark")
		assert(snapshot: sut.snapshot(for: .iPhone8(style: .light, contentSize: .extraExtraExtraLarge)), named: "IMAGE_COMMENTS_light_extraExtraExtraLarge")
	}

	// MARK: - Helpers

	private func makeSUT() -> ListViewController {
		let bundle = Bundle(for: ListViewController.self)
		let storyboard = UIStoryboard(name: "ImageComments", bundle: bundle)
		let controller = storyboard.instantiateInitialViewController() as! ListViewController
		controller.loadViewIfNeeded()
		controller.tableView.showsVerticalScrollIndicator = false
		controller.tableView.showsHorizontalScrollIndicator = false
		return controller
	}

	private func commentCellControllers() -> [CellController] {
		let commentControllers = commentViewModels().map(ImageCommentCellController.init)
		return commentControllers.map { CellController(id: UUID(), $0) }
	}

	private func commentViewModels() -> [ImageCommentViewModel] {
		return [
			ImageCommentViewModel(
				message: "The East Side Gallery is an open-air gallery in Berlin. It consists of a series of murals painted directly on a 1,316 m long remnant of the Berlin Wall, located near the centre of Berlin, on Mühlenstraße in Friedrichshain-Kreuzberg. The gallery has official status as a Denkmal, or heritage-protected landmark.",
				date: "1000 years ago",
				username: "a long long long long long username"
			),
			ImageCommentViewModel(
				message: "Garth Pier is a Grade II listed structure in Bangor, Gwynedd, North Wales.",
				date: "10 days ago",
				username: "a username"
			),
			ImageCommentViewModel(
				message: "nice",
				date: "1 hour ago",
				username: "a."
			)
		]
	}
}
