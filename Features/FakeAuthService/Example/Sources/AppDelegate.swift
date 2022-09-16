import UIKit
import AuthService
import Common

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {

        FirebaseAuthService.instance.login(login: "me", password: "mypass")
        FirebaseAuthService.instance.isLoginned()

        return true
    }

}
