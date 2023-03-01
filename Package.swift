// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "swift-swiftuiprelude",
	platforms: [
		.iOS(.v11),
		.macOS(.v10_15)
	],
	products: [
		.library(
			name: "SwiftUIPrelude",
			targets: ["SwiftUIPrelude"]
		)
	],
	dependencies: [],
	targets: [
		.target(
			name: "SwiftUIPrelude",
			dependencies: []
		),
		.testTarget(
			name: "SwiftUIPreludeTests",
			dependencies: ["SwiftUIPrelude"]
		)
	]
)
