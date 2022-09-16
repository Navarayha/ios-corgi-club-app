import UIKit
import HomeCoordinator
import FirebaseCore
import Common
import

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        
        FirebaseApp.configure()
        var homeCoordinator = HomeCoordinator(authService: Fake)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: homeCoordinator.configureLoginVC())
        window?.makeKeyAndVisible()

        return true
    }

}
