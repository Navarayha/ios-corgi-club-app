import UIKit
import Common
import LoginUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

@main
class AppDelegate: UIResponder, UIApplicationDelegate, LoginViewControllerDelegate {
    
    func doLogin(mail: String, password: String) {
        
        
        print("hi")
        
//        Firestore.firestore().collection("doggies").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    print("\(document.documentID) => \(document.data())")
//                }
//            }
//        }
        

       Firestore.firestore().collection("doggies").addDocument(data: ["name": "hello"])

        
        
    }

    var window: UIWindow?
    
    var loginController: LoginViewController!

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        
        FirebaseApp.configure()
        
        Auth.auth().signIn(withEmail: "me@me.me", password: "123456") { user, error in
          if let error = error, user == nil {
            print("Login error \(error)")
          } else {
            print("Seems everything is fine!")
          }
        }
        
        loginController = LoginViewController()
        loginController.delegate = self
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: loginController)
        window?.makeKeyAndVisible()
        
        return true
    }

}
