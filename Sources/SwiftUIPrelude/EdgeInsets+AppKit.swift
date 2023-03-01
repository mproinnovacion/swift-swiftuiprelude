#if canImport(AppKit)
import AppKit
import SwiftUI

extension EdgeInsets {
	public static func from(
		_ insets: NSEdgeInsets
	) -> Self {
		.init(
			top: insets.top,
			leading: insets.left,
			bottom: insets.bottom,
			trailing: insets.right
		)
	}
}

#endif
