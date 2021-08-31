//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import XCTest
import EssentialFeed

class ImageCommentsEndpointTests: XCTestCase {
	func test_url_createsCommentsEndpointURL() {
		let imageID = UUID(uuidString: "2239CBA2-CB35-4392-ADC0-24A37D38E010")!
		let baseURL = URL(string: "https://ile-api.essentialdeveloper.com/essential-feed")!

		let received = ImageCommentsEndpoint.get(imageID).url(baseURL: baseURL)
		let expected = URL(string: "https://ile-api.essentialdeveloper.com/essential-feed/v1/image/2239CBA2-CB35-4392-ADC0-24A37D38E010/comments")!

		XCTAssertEqual(received, expected)
	}
}
