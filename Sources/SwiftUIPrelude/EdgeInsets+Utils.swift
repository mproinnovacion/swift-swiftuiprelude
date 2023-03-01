import SwiftUI

extension EdgeInsets {
	public init(vertical: CGFloat, horizontal: CGFloat) {
		self.init(
			top: vertical,
			leading: horizontal,
			bottom: vertical,
			trailing: horizontal
		)
	}
	
	public init(_ value: CGFloat) {
		self.init(vertical: value, horizontal: value)
	}
	
	public func top(_ value: CGFloat) -> EdgeInsets {
		var result = self
		result.top = value
		return result
	}
	
	public func bottom(_ value: CGFloat) -> EdgeInsets {
		var result = self
		result.bottom = value
		return result
	}
	
	public func leading(_ value: CGFloat) -> EdgeInsets {
		var result = self
		result.leading = value
		return result
	}
	
	public func trailing(_ value: CGFloat) -> EdgeInsets {
		var result = self
		result.trailing = value
		return result
	}
	
	public var onlyVertical: EdgeInsets {
		.init(top: self.top, leading: 0, bottom: self.bottom, trailing: 0)
	}
	
	public var onlyHorizontal: EdgeInsets {
		.init(top: 0, leading: self.leading, bottom: 0, trailing: self.trailing)
	}
	
	public static func horizontal(_ value: CGFloat) -> EdgeInsets {
		.init(vertical: 0, horizontal: value)
	}
	
	public static func vertical(_ value: CGFloat) -> EdgeInsets {
		.init(vertical: value, horizontal: 0)
	}
	
	public static func top(_ value: CGFloat) -> EdgeInsets {
		.init(top: value, leading: 0, bottom: 0, trailing: 0)
	}
	
	public static func leading(_ value: CGFloat) -> EdgeInsets {
		.init(top: 0, leading: value, bottom: 0, trailing: 0)
	}
	
	public static func trailing(_ value: CGFloat) -> EdgeInsets {
		.init(top: 0, leading: 0, bottom: 0, trailing: value)
	}
	
	public static func bottom(_ value: CGFloat) -> EdgeInsets {
		.init(top: 0, leading: 0, bottom: value, trailing: 0)
	}
	
	public static func + (_ leading: EdgeInsets, _ trailing: EdgeInsets) -> EdgeInsets {
		EdgeInsets(
			top: leading.top + trailing.top,
			leading: leading.leading + trailing.leading,
			bottom: leading.bottom + trailing.bottom,
			trailing: leading.trailing + trailing.trailing
		)
	}
	
	public static prefix func -(_ value: EdgeInsets) -> EdgeInsets {
		EdgeInsets.init(top: -value.top, leading: -value.leading, bottom: -value.bottom, trailing: -value.trailing)
	}
	
	public var width: CGFloat {
		leading + trailing
	}
	
	public var height: CGFloat {
		top + bottom
	}
	
	public var size: CGSize {
		.init(width: width, height: height)
	}
}
