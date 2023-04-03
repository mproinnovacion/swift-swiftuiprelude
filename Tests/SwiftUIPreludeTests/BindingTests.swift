import XCTest
import SwiftUI
import SwiftUIPrelude

class BindingTests: XCTestCase {
	func testNilCoalescing() {
		var number: Int? = nil
		
		let binding = Binding(
			get: { number },
			set: { number = $0 }
		)
		
		let withDefault = binding ?? 7
		
		XCTAssertEqual(
			binding.wrappedValue,
			nil
		)
		
		XCTAssertEqual(
			withDefault.wrappedValue,
			7
		)
	}
}
