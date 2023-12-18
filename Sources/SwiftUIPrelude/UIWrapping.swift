//
//  UIWrapping.swift
//
//
//  Created by Rubén García on 13/9/23.
//

#if os(iOS)
import SwiftUI
/**
 This UIWrapping allows you to build a UIKit component without any more than defining in a clousure how it will be build. Provides a convenient 'wrapper' around a UIView
 
 UIWrapping<UILabel> { view in
     view.numberOfLines = 0
     view.text = "Lets enable\nmultiple lines"
     view.textAlignment = .center
 }
 .fixedSize()
 */
public struct UIWrapping<V: UIView>: View {
    let wrapped: ViewWrapper<V>
    public var body: some View { wrapped }
}

public extension UIWrapping {
    /// Instantiates a wrapper for a `UIView`
    /// - Parameters:
    ///   - viewProvider: Use this closure to return an instantiated `UIView`
    ///   - updateHandler: Use this closure to configure the view, this is called for all SwiftUI view updates as well
    init(_ provider: @escaping RepresentableProvider<V>, update handler: (RepresentableUpdater<V>)? = nil) {
        wrapped = ViewWrapper(
            provider: provider,
            updater: handler
        )
    }

    /// Instantiates a wrapper for a `UIView` – uses `.init(frame:)`
    /// - Parameters:
    ///   - type: The type of `UIView` to wrap
    ///   - updateHandler: Use this closure to configure the view, this is called for all SwiftUI view updates as well
    init(_ type: V.Type = V.self, update handler: @escaping (V) -> ()){
        wrapped = ViewWrapper(
            provider: { V.init(frame: .zero) },
            updater: handler
        )
    }
}

public typealias RepresentableProvider<V> = () -> V
public typealias RepresentableUpdater<V> = (V) -> ()

public struct ViewWrapper<V: UIView>: UIViewRepresentable {
    let provider: RepresentableProvider<V>
    let updater: RepresentableUpdater<V>?

    public func makeUIView(context: Context) -> V {
        provider()
    }

    public func updateUIView(_ view: V, context: Context) {
        view.backgroundColor = .clear
        updater?(view)
    }
}

struct UIWrapping_Preview: PreviewProvider {
    static var previews: some View {
        UIWrapping<UILabel> { view in
            view.numberOfLines = 0
            view.text = "Lets enable\nmultiple lines"
            view.textAlignment = .center
        }
        .fixedSize()
    }
}
#endif
