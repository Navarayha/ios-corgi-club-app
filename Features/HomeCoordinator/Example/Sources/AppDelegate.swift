import UIKit
import HomeCoordinator

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var homeCoordinator = HomeCoordinator()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = homeCoordinator.configureLoginVC()
        window?.makeKeyAndVisible()

        return true
    }

}
