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
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFireStoreMessage()
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        tableView.dataSource = self
        navTitleAnimate()
        navigationItem.hidesBackButton = true
    }
    
    func navTitleAnimate() {
        var charIndex = 0.0
        let labelText = "🤳🏼Tie_Up🤳🏼"
        title = ""
        for text in labelText {
            Timer.scheduledTimer(withTimeInterval: 0.2 * charIndex, repeats: false) { (timer) in
                self.title?.append(text)
            }
            charIndex += 1
        }
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
                    self.messageTextfield.text = ""
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
                    self.messages = []
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageData = data["message"] as? String, let senderData = data["sender"] as? String {
                            let messageObj = Message(sender: senderData, body: messageData)
                            self.messages.append(messageObj)
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                
                                // scroll the row to top
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                                
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
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.item]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! MessageCell
        cell.messageLabel.text = message.body
        
        //find user login
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: "BrandLightPurple")
            cell.messageLabel.textColor = UIColor(named: "BrandPurple")
        } else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: "BrandPurple")
            cell.messageLabel.textColor = UIColor(named: "BrandLightPurple")
        }
        
        return cell
    }
    
    
}
