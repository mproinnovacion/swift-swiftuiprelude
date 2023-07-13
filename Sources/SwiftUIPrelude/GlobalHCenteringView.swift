import Foundation
import SwiftUI

public struct GlobalHCenteringView<Content: View>: View {
	@State private var childSize: CGSize = .zero

	private let content: () -> Content
	
	public init(
		content: @escaping () -> Content
	) {
		self.content = content
	}
	
	func offsetX(
		frame: CGRect,
		parentWidth: CGFloat
	) -> CGFloat {
		let parentCenter = parentWidth / 2
		
		let childWidth = ceil(childSize.width)
		let childHalf = childWidth / 2
				
		let childPosition = parentCenter - childHalf - frame.origin.x
		
		let minX = childPosition
		let maxX = childPosition + childWidth
		
		let centerInFrame = (frame.width - childWidth) / 2
		
		return minX < 0
			? centerInFrame
			: maxX > frame.width
				? centerInFrame
				: childPosition
	}
	
	public var body: some View {
		GeometryReader { geometry in
			content()
				.onSizeChanged(ChildViewSize.self) { size in
					self.childSize = size
				}
				.frame(height: geometry.frame(in: .global).height)
				.offset(
					x: self.offsetX(
						frame: geometry.frame(in: .global),
						parentWidth: UIScreen.main.bounds.width
					),
					y: 0
				)
		}
		.frame(height: childSize.height)
	}
}
