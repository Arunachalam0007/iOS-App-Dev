# iOS-App-Dev-

# TIE_UP_APP


 
# FireBase Authentication & FireStore DB: (Add or Create Data into firestore)    
1.  Register or SignIN to FireBase: (https://firebase.google.com/docs/auth/ios/password-auth)              if let email = emailTextfield.text , let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
              // ...
                if let e = error {
                    print("Error: ",e.localizedDescription)
                } else {
                    print(email," Registered")
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                }
            }
         }  
2. Get User from FireBase: (https://firebase.google.com/docs/auth/admin/manage-users)         if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
              // ...
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    print(authResult!," Logged In")
                    self.performSegue(withIdentifier: "LoginToChat", sender: self)
                }
            }
        }

3. AddFireStoreDB: https://firebase.google.com/docs/firestore/quickstart#swift
4. We need to create one database (Cloud Firestore or Realtime DB) recommend FireStore
5.  We need to initialise DB:       let fireDB = Firestore.firestore()
6. Create Firestore Collection and Add Document in Dict format:           // Get SenderEmail and Message and add to Firestore
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

5. Read or Load FireStoreMessage: (https://firebase.google.com/docs/reference/swift/firebasefirestore/api/reference/Classes/QuerySnapshot)     func loadFireStoreMessage()  {
        
        fireDB.collection("Messages").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
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

6. addSnapShotListener: which is called the method frequently whenever the db got updated    // addSnapshotListener which is called the method frequently whenever the db got updated
        fireDB.collection("Messages").addSnapshotListener() { (querySnapshot, err) in
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

7. Order:         fireDB.collection("Messages").order(by: "messageSendingTime").addSnapshotListener() { (querySnapshot, err) in  
