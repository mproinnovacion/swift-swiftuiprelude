#if canImport(UIKit)
import UIKit
import SwiftUI

extension EdgeInsets {
	public static func from(
		_ insets: UIEdgeInsets
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
