//
//  ViewController.swift
//  CorgiClubApp
//
//  Created by Afir Thes on 02.09.2022.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import UIKit
import Common
import FirebaseAuth
import FirebaseDatabase
import CommonUI

public protocol LoginViewControllerDelegate: AnyObject {
    func doLogin(vc: UIViewController)
}

public class LoginViewController: UIViewController {
    
    private let notificationCentre = NotificationCenter.default
    
    private let decoder = JSONDecoder()
//
    private var databasePath: DatabaseReference? // = {
//      guard let uid = Auth.auth().currentUser?.uid else {
//        return nil
//      }
//      let ref = Database.database().reference().child("users/\(uid)")
//      return ref
//        return DatabaseReference()
//    }()
    
    
    public var delegate: LoginViewControllerDelegate?
    
    private let logInButtom = CommonViews.createColorButtonView(title: "log in")
    
    private let loginView = CommonViews.createTextFieldView(placeholder: "email", isSecure: false)
    
    private let passView = CommonViews.createTextFieldView(placeholder: "password", isSecure: true)
    
    private let createAccountButtom = CommonViews.createWhiteButton(title: "create account")

    private let resetPassButtom = CommonViews.createWhiteButton(title: "reset password")
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()

    private lazy var contentView: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    private lazy var cicleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "color", in: LoginUIResources.bundle, compatibleWith: nil)
        view.clipsToBounds = true
        return view
    }()
    
    private let appNameLabel = CommonViews.CreateLargeTitleLabelView(title: "Corgi club")
       
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo", in: LoginUIResources.bundle, compatibleWith: nil)
        image.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
   
    private lazy var alert: UIAlertController = {
        let alert = UIAlertController(title: "", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default , handler: nil))
        return alert
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
    }
    
    private func setup() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        self.contentView.addSubview(cicleView)
        self.contentView.addSubview(logoImage)
        self.contentView.addSubview(appNameLabel)
        self.contentView.addSubview(loginView)
        self.contentView.addSubview(passView)
        self.contentView.addSubview(logInButtom)
        logInButtom.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        self.contentView.addSubview(createAccountButtom)
        createAccountButtom.addTarget(self, action: #selector(didTapCreateAccountButtom), for: .touchUpInside)
        self.contentView.addSubview(resetPassButtom)
        resetPassButtom.addTarget(self, action: #selector(didTapResetPassButtom), for: .touchUpInside)
        self.view.addGestureRecognizer(tap)
        
        let inset: CGFloat = 14
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: self.view.layer.bounds.width/3),
            logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor),
            logoImage.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -self.view.layer.bounds.height/8)
        ])
        
        NSLayoutConstraint.activate([
            appNameLabel.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            appNameLabel.bottomAnchor.constraint(equalTo: self.logoImage.topAnchor, constant: -self.view.layer.bounds.height/16),
            appNameLabel.heightAnchor.constraint(equalToConstant: 38)
        ])
        
        NSLayoutConstraint.activate([
            cicleView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cicleView.centerYAnchor.constraint(equalTo: contentView.topAnchor, constant: inset*3),
            cicleView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 2),
            cicleView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.5)
        ])
        
        NSLayoutConstraint.activate([
            loginView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            loginView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 70),
            loginView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor),
            loginView.heightAnchor.constraint(equalToConstant: 38)
        ])
        
        NSLayoutConstraint.activate([
            passView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            passView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 70),
            passView.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: inset),
            passView.heightAnchor.constraint(equalToConstant: 38),
        ])
        
        NSLayoutConstraint.activate([
            logInButtom.topAnchor.constraint(equalTo: passView.bottomAnchor, constant: inset*2),
            logInButtom.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: self.view.layer.bounds.width/3),
            logInButtom.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            logInButtom.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            resetPassButtom.topAnchor.constraint(equalTo: self.logInButtom.bottomAnchor, constant: inset),
            resetPassButtom.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            resetPassButtom.heightAnchor.constraint(equalToConstant: 25),
        ])
        
        NSLayoutConstraint.activate([
            createAccountButtom.topAnchor.constraint(equalTo: resetPassButtom.bottomAnchor, constant: inset*10),
            createAccountButtom.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            createAccountButtom.heightAnchor.constraint(equalToConstant: 25),
            createAccountButtom.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
 
        logoImage.layer.cornerRadius = self.view.layer.bounds.width/6
        cicleView.layer.cornerRadius = self.view.layer.bounds.width
        
    }
        
    @objc private func didTapLoginButton() {

        Auth.auth().signIn(withEmail: loginView.text!, password: passView.text!) { [self] result, error in

            if result != nil && error == nil {
                
                delegate?.doLogin(vc: self)
                
                guard let databasePath = databasePath else {
                    return
                }

                databasePath.getData { error, snapshot in
                    guard error == nil else {
                        print(error!.localizedDescription)
                        return;
                    }

                    var json = snapshot?.value as? [String: Any]
                    json?["id"] = snapshot!.key

                    
//                    do {
//                        let userData = try JSONSerialization.data(withJSONObject: json as Any)
//                        let user = try self.decoder.decode(User.self, from: userData)
//                        let vc = ProfileViewController()
//                        vc.nameView.text = user.name + " " + (user.id ?? "____")
//                        vc.cityView.text = user.city
//                        self.navigationController?.pushViewController(vc, animated: true)
//
//                    } catch {
//                        print("an error occurred", error)
//                    }
                }
            } else if error != nil {
                print(error!.localizedDescription)
                alert.title = error?.localizedDescription
                self.present(alert, animated: true, completion: nil)
            }
        }

    }
    
    //MARK: dismissKeyboardTap
    
    private lazy var tap: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        return tap
    }()
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func didTapCreateAccountButtom() {
        print("didTapCreateAccountButtom")
//        let createAccountVC = CreateAccountViewController()
//        navigationController?.present(createAccountVC, animated: true)
    }
    
    @objc private func didTapResetPassButtom() {
        print("didTapResetPassButtom")
    }
       
    @objc func loginPressed() {
//        delegate.doLogin(vc: self)
        print("delegate")
    }
    

}

// MARK: - Keyboard
// сдвигает вью вверх если клавиатура перекрывает выделенное поле ввода
extension LoginViewController {
  
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notificationCentre.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCentre.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        notificationCentre.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCentre.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height*1.3
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
            NSLayoutConstraint.activate([
//                createAccountButtom.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 14),
//                createAccountButtom.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -kbdSize.height)
            ])
        }
    }
    
    @objc private func kbdHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
        
        NSLayoutConstraint.activate([
//            createAccountButtom.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),
//            createAccountButtom.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}
