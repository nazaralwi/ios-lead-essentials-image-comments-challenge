//
// Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation

public struct ImageCommentsMapper {
	private struct Root: Decodable {}

	public enum Error: Swift.Error {
		case invalidData
	}

	public static func map(_ data: Data, from response: HTTPURLResponse) throws -> [ImageComment] {
		guard isOK(response), let _ = try? JSONDecoder().decode(Root.self, from: data) else {
			throw Error.invalidData
		}

		return [ImageComment]()
	}

	private static func isOK(_ response: HTTPURLResponse) -> Bool {
		(200 ... 299).contains(response.statusCode)
	}
}
