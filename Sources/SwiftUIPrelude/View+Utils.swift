import SwiftUI

extension View {
	/// Hide or show the view based on a boolean value.
	///
	/// Example for visibility:
	/// ```
	/// Text("Label")
	///     .isHidden(true)
	/// ```
	///
	/// Example for complete removal:
	/// ```
	/// Text("Label")
	///     .isHidden(true, remove: true)
	/// ```
	///
	/// - Parameters:
	///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
	///   - remove: Boolean value indicating whether or not to remove the view.
	@ViewBuilder public func isHidden(
		_ hidden: Bool,
		remove: Bool = false
	) -> some View {
		if hidden {
			if !remove {
				self.hidden()
			}
		} else {
			self
		}
	}
	
	@ViewBuilder public func isVisible(
		_ visible: Bool,
		remove: Bool = false
	) -> some View {
		isHidden(visible == false, remove: remove)
	}
    
    /// Warning: Don't use it for animation or if the condition depends on State that changes too often
    @ViewBuilder
    func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }
    
    /// Warning: Don't use it for animation or if the condition depends on State that changes too often
    @ViewBuilder
    func iflet<Content: View, T>(_ conditional: Optional<T>, @ViewBuilder _ content: (Self, _ value: T) -> Content) -> some View {
        if let value = conditional {
            content(self, value)
        } else {
            self
        }
    }
}

extension View {
	@inlinable public func frame(
		size: CGSize?,
		alignment: Alignment = .center
	) -> some View {
		self.frame(
			width: size?.width,
			height: size?.height,
			alignment: alignment
		)
	}
}
