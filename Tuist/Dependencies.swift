import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(url: "https://github.com/firebase/firebase-ios-sdk", requirement:.upToNextMajor(from:"9.0.0")),
        .remote(url: "https://github.com/Alamofire/Alamofire.git", requirement:.upToNextMajor(from: "5.6.1"))
    ],
    platforms: [.iOS]
)
