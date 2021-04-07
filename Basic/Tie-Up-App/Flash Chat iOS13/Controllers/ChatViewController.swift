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
    
    var message: [Message] = [
        Message(sender: "sha@123", body: "Hi sha asdfasdfasdfs sdfasdfsadf safdasdf sadf asdfds af s asd fas dfs adf sdf sd"),
        Message(sender: "aru@123", body: "Hello aru"),
        Message(sender: "kalai@123", body: "AK")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            myFireDB = fireDB.collection("Messages").addDocument(data: ["sender":senderEmail,"message":message]) { (error) in
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
