import UIKit
import LoginUI
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = LoginViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

}
