import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project
let project = Project.app(name: "CorgiClubApp",
                          platform: .iOS,
                          externalDependencies: [],
                          targetDependancies: [],
                          moduleTargets: [
                              makeLoginUIModule(),
                              makeCommonModule(),
                              makeFeedUIModule(),
                              makeProfileUIModule(),
                              makeMeetingsUIModule(),
                              makeHomeCoordinatorModule(),
                              makeAuthServiceModule(),
                              makeCommonUIModule(),
                              makeCreateUserUIModule()
                          ])

func makeHomeCoordinatorModule() -> Module {
    return Module(name: "HomeCoordinator",
            path: "HomeCoordinator",
            frameworkDependancies: [
                .target(name: "Common"),
                .target(name: "LoginUI"),
                .target(name: "FeedUI"),
            ],
            exampleDependencies: [
                .target(name: "Common"),
                .target(name: "LoginUI"),
                .target(name: "FeedUI"),
                .target(name: "AuthService")
            ],
            frameworkResources: ["Sources/**/*.storyboard", "Resources/**"],
            exampleResources: ["Resources/**"],
            testResources: [])
}

func makeAuthServiceModule() -> Module {
    return Module(name: "AuthService",
            path: "AuthService",
            frameworkDependancies: [.target(name: "Common")],
            exampleDependencies: [.target(name: "Common")],
            frameworkResources: ["Sources/**/*.storyboard", "Resources/**"],
            exampleResources: ["Resources/**"],
            testResources: [])
}

func makeProfileUIModule() -> Module {
    return Module(name: "ProfileUI",
            path: "ProfileUI",
            frameworkDependancies: [.target(name: "Common")],
            exampleDependencies: [],
            frameworkResources: ["Sources/**/*.storyboard", "Resources/**"],
            exampleResources: ["Resources/**"],
            testResources: [])
}

func makeMeetingsUIModule() -> Module {
    return Module(name: "MeetingsUI",
            path: "MeetingsUI",
            frameworkDependancies: [.target(name: "Common")],
            exampleDependencies: [],
            frameworkResources: ["Sources/**/*.storyboard", "Resources/**"],
            exampleResources: ["Resources/**"],
            testResources: [])
}

func makeLoginUIModule() -> Module {
    return Module(name: "LoginUI",
            path: "LoginUI",
                  frameworkDependancies: [
                      .target(name: "Common"),
                      .target(name: "CommonUI")
                  ],
            exampleDependencies: [],
            frameworkResources: ["Sources/**/*.storyboard", "Resources/**"],
            exampleResources: ["Resources/**"],
            testResources: [])
}

func makeCreateUserUIModule() -> Module {
    return Module(name: "CreateUserUI",
            path: "CreateUserUI",
                  frameworkDependancies: [
                      .target(name: "Common"),
                      .target(name: "CommonUI")
                  ],
            exampleDependencies: [],
            frameworkResources: ["Sources/**/*.storyboard", "Resources/**"],
            exampleResources: ["Resources/**"],
            testResources: [])
}

func makeFeedUIModule() -> Module {
    return Module(name: "FeedUI",
            path: "FeedUI",
            frameworkDependancies: [.target(name: "Common")],
            exampleDependencies: [],
            frameworkResources: ["Sources/**/*.storyboard", "Resources/**"],
            exampleResources: ["Resources/**"],
            testResources: [])
}

func makeCommonModule() -> Module {
    return Module(name: "Common",
            path: "Common",
            frameworkDependancies: [],
            exampleDependencies: [],
            frameworkResources: ["Sources/**/*.xib"],
            exampleResources: ["Resources/**"],
            testResources: [],
            targets: [.framework])
}

func makeCommonUIModule() -> Module {
    return Module(name: "CommonUI",
            path: "CommonUI",
            frameworkDependancies: [],
            exampleDependencies: [],
            frameworkResources: ["Sources/**/*.swift", "Resources/**"],
            exampleResources: ["Resources/**"],
            testResources: [],
            targets: [.framework])
}
