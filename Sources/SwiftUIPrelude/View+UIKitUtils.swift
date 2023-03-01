#if canImport(UIKit)
import UIKit
import SwiftUI

extension View {
	public func endEditing() {
		UIApplication.shared.sendAction(
			#selector(UIResponder.resignFirstResponder),
			to: nil,
			from: nil,
			for: nil
		)
	}
}

#endif
