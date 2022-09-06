//
//  ViewController.swift
//  CorgiClubApp
//
//  Created by Afir Thes on 02.09.2022.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import UIKit
import Common


public protocol LoginDelegate {
    func doLogin(vc: UIViewController)
}

public class LoginViewController: UIViewController {
    
    private let notificationCentre = NotificationCenter.default
    
    public var delegate: LoginDelegate!
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
//        scroll.backgroundColor = .blue
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
    
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(named: "logo", in: LoginUIResources.bundle, compatibleWith: nil)
        image.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()

    static var loginView: UITextField = {
        let text = UITextField()
        text.backgroundColor = .systemGray6
        text.placeholder = "email"
        text.font = UIFont.systemFont(ofSize: 16)
        text.keyboardType = UIKeyboardType.emailAddress
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 2))
        text.leftView = leftView
        text.leftViewMode = .always
        text.autocapitalizationType = .none
        text.tintColor = .black
        text.textColor = .black
        text.layer.borderWidth = 0.5
        text.layer.borderColor = UIColor.lightGray.cgColor
        text.clearButtonMode = .whileEditing
        text.clearButtonMode = .unlessEditing
        text.clearButtonMode = .always
        text.clipsToBounds = true
        text.layer.cornerRadius = 14
//        text.delegate = self
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    static var passView: UITextField = {
        let password = UITextField()
        password.backgroundColor = .systemGray6
        password.placeholder = "password"
        password.font = UIFont.systemFont(ofSize: 16)
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 2))
        password.leftView = leftView
        password.leftViewMode = .always
        password.autocapitalizationType = .none
        password.tintColor = .black
        password.isSecureTextEntry = true
        password.textColor = .black
        password.layer.borderWidth = 0.5
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.clearButtonMode = .whileEditing
        password.clearButtonMode = .unlessEditing
        password.clearButtonMode = .always
        password.clipsToBounds = true
        password.layer.cornerRadius = 14
//        password.delegate = self
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    private lazy var logInButtom: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "color", in: LoginUIResources.bundle, compatibleWith: nil)
        button.setTitle("log in", for: .normal)
        button.layer.cornerRadius = 14
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var createAccountButtom: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("create account", for: .normal)
        button.setTitleColor(UIColor(named: "color", in: LoginUIResources.bundle, compatibleWith: nil), for: .normal)
        button.addTarget(self, action: #selector(didTapCreateAccountButtom), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var resetPassButtom: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("reset password", for: .normal)
        button.setTitleColor(UIColor(named: "color", in: LoginUIResources.bundle, compatibleWith: nil), for: .normal)
        button.addTarget(self, action: #selector(didTapResetPassButtom), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
//        print(Util.doStuff())
        view.backgroundColor = .white
    }
    
    private func setup() {
        self.view.addSubview(scrollView)
        self.contentView.addSubview(cicleView)
        self.contentView.addSubview(logoImage)
        
        self.contentView.addSubview(LoginViewController.loginView)
        self.contentView.addSubview(LoginViewController.passView)
        self.contentView.addSubview(logInButtom)
        self.contentView.addSubview(createAccountButtom)
        self.contentView.addSubview(resetPassButtom)
        self.view.addGestureRecognizer(tap)
        
        let inset: CGFloat = 14
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            LoginViewController.loginView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            LoginViewController.loginView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 70),
            LoginViewController.loginView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor),
            LoginViewController.loginView.heightAnchor.constraint(equalToConstant: 38)
        ])
        
        NSLayoutConstraint.activate([
            LoginViewController.passView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            LoginViewController.passView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 70),
            LoginViewController.passView.topAnchor.constraint(equalTo: LoginViewController.loginView.bottomAnchor, constant: inset),
            LoginViewController.passView.heightAnchor.constraint(equalToConstant: 38),
        ])
        
        NSLayoutConstraint.activate([
            logInButtom.topAnchor.constraint(equalTo: LoginViewController.passView.bottomAnchor, constant: inset*2),
            logInButtom.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: self.view.layer.bounds.width/3),
            logInButtom.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            logInButtom.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        NSLayoutConstraint.activate([
            resetPassButtom.topAnchor.constraint(equalTo: self.logInButtom.bottomAnchor, constant: inset),
            resetPassButtom.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            resetPassButtom.heightAnchor.constraint(equalToConstant: 25),
        ])
        
        NSLayoutConstraint.activate([
            createAccountButtom.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            createAccountButtom.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            createAccountButtom.heightAnchor.constraint(equalToConstant: 25),
//            createAccountButtom.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: self.view.layer.bounds.width/3),
            logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor),
            logoImage.bottomAnchor.constraint(equalTo: LoginViewController.loginView.topAnchor, constant: -self.view.layer.bounds.height/8)
        ])
        
        NSLayoutConstraint.activate([
            cicleView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            cicleView.centerYAnchor.constraint(equalTo: scrollView.topAnchor, constant: -inset*3),
            cicleView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 2),
            cicleView.heightAnchor.constraint(equalTo: cicleView.widthAnchor)
        ])
        
        logoImage.layer.cornerRadius = self.view.layer.bounds.width/6
        cicleView.layer.cornerRadius = self.view.layer.bounds.width
        print(self.view.layer.bounds.width)
    }
    
    @objc private func didTapLoginButton() {
        
        print("didTapLoginButton")
        
//        Auth.auth().signIn(withEmail: LoginViewController.loginView.text!, password: LoginViewController.passView.text!) { [self] result, error in
//
//            if result != nil && error == nil {
//                guard let databasePath = databasePath else {
//                    return
//                }
//
//                databasePath.getData { [self] error, snapshot in
//                    guard error == nil else {
//                        print(error!.localizedDescription)
//                        return;
//                    }
//
//                    var json = snapshot?.value as? [String: Any]
//                    json?["id"] = snapshot!.key
//
//                    do {
//
//                        let userData = try JSONSerialization.data(withJSONObject: json as Any)
//
//                        let user = try self.decoder.decode(User.self, from: userData)
//
//                        let vc = ProfileViewController()
//                        vc.nameView.text = user.name + " " + (user.id ?? "____")
//                        vc.cityView.text = user.city
//                        self.navigationController?.pushViewController(vc, animated: true)
//
//                    } catch {
//                        print("an error occurred", error)
//                    }
//                }
//            } else if error != nil {
//                print(error!.localizedDescription)
//                alert.title = error?.localizedDescription
//                self.present(alert, animated: true, completion: nil)
//            }
//        }
        
        
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
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
            NSLayoutConstraint.activate([
                createAccountButtom.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),
//                createAccountButtom.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -kbdSize.height)
            ])
        }
    }
    
    @objc private func kbdHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
        
        NSLayoutConstraint.activate([
            createAccountButtom.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -14),
//            createAccountButtom.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}
