import UIKit
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
            _ application: UIApplication,
            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIViewController()
        window?.rootViewController?.view.backgroundColor = .systemGreen
        window?.makeKeyAndVisible()

        FirebaseApp.configure()

        Auth.auth().signIn(withEmail: "test@test.ru", password: "123123123") { _, error in
            print("Logged In!")

            self.window?.rootViewController = ViewController()
        }

        return true
    }

}
