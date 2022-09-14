//
//  CreateUserViewController.swift
//  CorgiClubApp
//
//  Created by Mikhail Chuparnov on 14.09.2022.
//  Copyright © 2022 Sonomos.com. All rights reserved.
//

import UIKit
import CommonUI
//import FirebaseAuth
//import FirebaseDatabase

public class CreateUserViewController: UIViewController {
    
    let userNameTextField = CommonViews.createTextFieldView(placeholder: "Name", isSecure: false)
    
    let userSecondNameTextField = CommonViews.createTextFieldView(placeholder: "Second Name", isSecure: false)
    
    let emailTextField = CommonViews.createTextFieldView(placeholder: "email", isSecure: false)
    
    let passwordTextField = CommonViews.createTextFieldView(placeholder: "password", isSecure: true)
    
    let repeatPasswordTextField = CommonViews.createTextFieldView(placeholder: "repeat password", isSecure: true)
    
    let createUserButton = CommonViews.createColorButtonView(title: "Sign in")
    
//    private lazy var databasePath = Data
    
//    private lazy var databasePath: DatabaseReference? = {
//      guard let uid = Auth.auth().currentUser?.uid else {
//        return nil
//      }
//      let ref = Database.database().reference().child("users/\(uid)")
//      return ref
//    }()
    
    private lazy var alert: UIAlertController = {
        let alert = UIAlertController(title: "", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default , handler: nil))
        return alert
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupController()
    }

    private func setupController() {
        self.view.addGestureRecognizer(tap)
        self.view.addSubview(userNameTextField)
        self.view.addSubview(userSecondNameTextField)
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(repeatPasswordTextField)
        self.view.addSubview(createUserButton)
        createUserButton.addTarget(self, action: #selector(didTapCreateUserButtom), for: .touchUpInside)
        let inset: CGFloat = 14
        
        NSLayoutConstraint.activate([
            userNameTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            userNameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: inset*2),
            userNameTextField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: inset*3),
            userNameTextField.heightAnchor.constraint(equalToConstant: 38)
        ])
        
        NSLayoutConstraint.activate([
            userSecondNameTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            userSecondNameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: inset*2),
            userSecondNameTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: inset),
            userSecondNameTextField.heightAnchor.constraint(equalToConstant: 38),
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: inset*2),
            emailTextField.topAnchor.constraint(equalTo: userSecondNameTextField.bottomAnchor, constant: inset*2),
            emailTextField.heightAnchor.constraint(equalToConstant: 38),
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: inset*2),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: inset*2),
            passwordTextField.heightAnchor.constraint(equalToConstant: 38),
        ])
        
        NSLayoutConstraint.activate([
            repeatPasswordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            repeatPasswordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: inset*2),
            repeatPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: inset),
            repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 38),
        ])
        
        NSLayoutConstraint.activate([
            createUserButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            createUserButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: inset*3),
            createUserButton.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: inset*2),
            createUserButton.heightAnchor.constraint(equalToConstant: 38),
        ])
    }

    @objc private func didTapCreateUserButtom() {
        print("didTapCreateUserButtom")
//        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { [self] authDataResult, error in
//
//            if error != nil {
//                print(error!.localizedDescription)
//                alert.title = error?.localizedDescription
//                self.present(alert, animated: true, completion: nil)
//            }
////
////            takeUid()
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
    
}
