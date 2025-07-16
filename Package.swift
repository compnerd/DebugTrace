// swift-tools-version:6.0

import PackageDescription

let _: Package =
  Package(name: "debug-trace",
          products: [
            .executable(name: "dbgtrc", targets: ["DebugTrace"])
          ],
          targets: [
            .target(name: "WindowsCore"),
            .executableTarget(
              name: "DebugTrace",
              dependencies: [
                .target(name: "WindowsCore")
              ]),
          ])
