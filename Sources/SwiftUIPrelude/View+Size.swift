import Foundation
import SwiftUI

public protocol CGSizePreferenceKey: PreferenceKey where Value == CGSize {}

extension CGSizePreferenceKey {
	public static func reduce(value _: inout CGSize, nextValue: () -> CGSize) {
		_ = nextValue()
	}
}

extension View {
	public func onSizeChanged<Key: CGSizePreferenceKey>(
		_ key: Key.Type,
		perform action: @escaping (CGSize) -> Void
	) -> some View {
		self.background(
			GeometryReader { geo in
				Color.clear
					.preference(key: Key.self, value: geo.size)
			}
		)
		.onPreferenceChange(key) { value in
			action(value)
		}
	}
}

public struct ChildViewSize: CGSizePreferenceKey {
	public static var defaultValue: CGSize = .zero
}

