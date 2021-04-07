//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let fireDB = Firestore.firestore()
    
    var message: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFireStoreMessage()
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        tableView.dataSource = self
        title = "🤳🏼 Tie_Up 🤳🏼"
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        // Get SenderEmail and Message and add to Firestore
        if let senderEmail = Auth.auth().currentUser?.email, let message = messageTextfield.text {
            
            var myFireDB: DocumentReference? = nil
            // Add Data or Message into Firestore Cloud
            myFireDB = fireDB.collection("Messages").addDocument(data: ["sender":senderEmail,"message":message,"messageSendingTime":Date().timeIntervalSince1970]) { (error) in
                if let e = error {
                    print("Unable to Store your Data into FireStoreCloud: ",e)
                } else {
                    print("SuccessFully Stored Your Data and ID is: ",myFireDB!.documentID)
                }
            }
        }
        
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError  {
            print(signOutError)
        }
    }
    
    func loadFireStoreMessage()  {
        
        // addSnapshotListener which is called the method frequently whenever the db got updated
        fireDB.collection("Messages").order(by: "messageSendingTime").addSnapshotListener() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    // Make an empty of the Message Class object Array
                    self.message = []
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageData = data["message"] as? String, let senderData = data["sender"] as? String {
                            let messageObj = Message(sender: senderData, body: messageData)
                            self.message.append(messageObj)
                            
                            print("Messages: ",messageObj)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
}


extension ChatViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! MessageCell
        cell.messageLabel.text = message[indexPath.item].body
        return cell
    }
    
    
}
