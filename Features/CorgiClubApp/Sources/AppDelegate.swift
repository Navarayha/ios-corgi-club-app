import UIKit
import HomeCoordinator
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let navVC = UINavigationController(rootViewController: HomeCoordinator().configureLoginVC())
    
    func application(
            _ application: UIApplication,
            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()

        FirebaseApp.configure()

        Auth.auth().signIn(withEmail: "test@test.ru", password: "123123123") { _, error in
            print("Logged In!")

            self.window?.rootViewController = ViewController()
        }

        return true
    }

}
