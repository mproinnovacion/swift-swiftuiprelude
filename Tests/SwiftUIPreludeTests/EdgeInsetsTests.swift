import XCTest
import SwiftUI

import SwiftUIPrelude

class EdgeInsetsTests: XCTestCase {
	func testCreation() {
		XCTAssertEqual(EdgeInsets.top(10), EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
		XCTAssertEqual(EdgeInsets.bottom(10), EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
		XCTAssertEqual(EdgeInsets.leading(10), EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
		XCTAssertEqual(EdgeInsets.trailing(10), EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
		
		XCTAssertEqual(EdgeInsets(4).top(10), EdgeInsets(top: 10, leading: 4, bottom: 4, trailing: 4))
		XCTAssertEqual(EdgeInsets(4).bottom(10), EdgeInsets(top: 4, leading: 4, bottom: 10, trailing: 4))
		XCTAssertEqual(EdgeInsets(4).leading(10), EdgeInsets(top: 4, leading: 10, bottom: 4, trailing: 4))
		XCTAssertEqual(EdgeInsets(4).trailing(10), EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 10))
		
		XCTAssertEqual(EdgeInsets(4).onlyHorizontal, EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
		XCTAssertEqual(EdgeInsets(4).onlyVertical, EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
		
		XCTAssertEqual(EdgeInsets.horizontal(10), EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
		XCTAssertEqual(EdgeInsets.vertical(10), EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
		
		XCTAssertEqual(EdgeInsets(10) + EdgeInsets.vertical(4), EdgeInsets(top: 14, leading: 10, bottom: 14, trailing: 10))
		XCTAssertEqual(-EdgeInsets(10), EdgeInsets(top: -10, leading: -10, bottom: -10, trailing: -10))
		
		XCTAssertEqual(EdgeInsets.vertical(10).width, 0)
		XCTAssertEqual(EdgeInsets.vertical(10).height, 20)
		XCTAssertEqual(EdgeInsets.horizontal(10).width, 20)
		XCTAssertEqual(EdgeInsets.horizontal(10).height, 0)
		
		XCTAssertEqual(EdgeInsets.vertical(10).size, .init(width: 0, height: 20))
		XCTAssertEqual(EdgeInsets.horizontal(10).size, .init(width: 20, height: 0))
	}
}
