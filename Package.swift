// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "ModernAVPlayer",
    platforms: [.iOS(.v13), .tvOS(.v13)],
    products: [
        .library(name: "ModernAVPlayer", targets: ["ModernAVPlayer"]),
        .library(name: "CombineModernAVPlayer", targets: ["CombineModernAVPlayer"])
    ],
	dependencies: [
		.package(url: "https://github.com/dankinsoid/CombineOperators.git", .upToNextMajor(from: "1.38.0"))
	],
    targets: [
        .target(
			name: "ModernAVPlayer", 
			path: "Sources/Core"
		),
        .target(
			name: "CombineModernAVPlayer",
			dependencies: [
				.target(name: "ModernAVPlayer"),
				.product(name: "CombineOperators", package: "CombineOperators"),
				.product(name: "CombineCocoa", package: "CombineOperators")
			],
			path: "Sources/CombineModernAVPlayer"
		)
    ]
)
