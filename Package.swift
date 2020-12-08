// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TodoAPI",
    platforms: [
        .macOS(.v11)
    ],
    dependencies: [
        .package(url: "https://github.com/swift-server/swift-aws-lambda-runtime.git", from: "0.2.0"),
        .package(url: "https://github.com/swift-aws/aws-sdk-swift.git", from: "5.0.0")
    ],
    targets: [
        .target(
            name: "TodoAPI",
            dependencies: [
                .product(name: "AWSDynamoDB", package: "aws-sdk-swift"),
                .product(name: "AWSLambdaRuntime", package: "swift-aws-lambda-runtime"),
                .product(name: "AWSLambdaEvents", package: "swift-aws-lambda-runtime")
            ]),
        .testTarget(
            name: "TodoAPITests",
            dependencies: ["TodoAPI"]),
    ]
)
