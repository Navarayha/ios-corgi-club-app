import UIKit
import FirebaseAuthService
import HomeCoordinator
import FirebaseCore
import FirebaseFirestore


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let navVC = UINavigationController(rootViewController: HomeCoordinator(authService: FirebaseAuthService.instance).configureLoginVC())
    
    func application(
            _ application: UIApplication,
            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        
        FirebaseApp.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()



        return true
    }

}
