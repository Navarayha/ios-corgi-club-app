//
//  ViewController.swift
//  MyApp
//
//  Created by Afir Thes on 15.09.2022.
//  Copyright © 2022 Coffe&Code. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ViewController: UIViewController {
    
    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        print("Wazza!")
        
        print(Auth.auth().currentUser?.email)
        
        db.collection("messages")
            .order(by: "date")
            .addSnapshotListener {
                querySnapshot, error in
                
                if let e = error {
                    print("Issue retrieving data from firestore \(e)")
                    return
                }
                
                querySnapshot?.documents
                    .map{d in d.data()}
                    .forEach{d in
                        let sender = d["sender"] as? String
                        let body = d["body"] as? String
                        //let timestamp = d["date"] as? TimeInterval
                        
                         print("\(sender): \(body)")
                    }

        }
        
    }

}
