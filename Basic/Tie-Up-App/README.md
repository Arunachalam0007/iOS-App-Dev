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
