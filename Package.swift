// swift-tools-version:6.0

import PackageDescription

let _: Package =
  Package(name: "debug-trace",
          products: [
            .executable(name: "dbgtrc", targets: ["DebugTrace"])
          ],
          dependencies: [
            .package(url: "https://github.com/compnerd/swift-platform-core.git", branch: "main"),
          ],
          targets: [
            .executableTarget(
              name: "DebugTrace",
              dependencies: [
                .product(name: "WindowsCore", package: "swift-platform-core"),
              ]),
          ])
