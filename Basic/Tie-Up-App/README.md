# iOS-App-Dev-

# TIE_UP_APP


Fire Store: (Add or Create Data into firestore) 
1. https://firebase.google.com/docs/firestore/quickstart#swift
2. We need to create one database (Cloud Firestore or Realtime DB) recommend FireStore
3.  We need to initialise DB:       let fireDB = Firestore.firestore()
4. Create Firestore Collection and Add Document in Dict format:           // Get SenderEmail and Message and add to Firestore
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
        
5. Read or Load FireStoreMessage:
(https://firebase.google.com/docs/reference/swift/firebasefirestore/api/reference/Classes/QuerySnapshot)
 func loadFireStoreMessage()  {
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

