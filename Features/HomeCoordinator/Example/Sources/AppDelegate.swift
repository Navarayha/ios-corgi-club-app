import UIKit
import HomeCoordinator
import Common
import FakeAuthService

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
  
    let service = FakeAuthService()
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        
        let homeCoordinator = HomeCoordinator(authService: service)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: homeCoordinator.configureLoginVC())
        window?.makeKeyAndVisible()

        return true
    }

}
