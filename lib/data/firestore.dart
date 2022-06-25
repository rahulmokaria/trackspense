import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trackspense/data/data_functions.dart';

final db = FirebaseFirestore.instance;

void getStarted_addData() async {
  db
      .collection("data")
      .where("email", isEqualTo: userEmail)
      .snapshots()
      .listen((event) {
    for (var doc in event.docs) {
      userName = doc.data()["name"];
      userImage = doc.data()["image"];
      totalExpense = doc.data()["totalExpense"];
      totalIncome = doc.data()["totalIncome"];
      balance = doc.data()["balance"];
    }
    print("name: $userName");
    print("image:  $userImage");
    print("balance: $balance");
    // ties in CA: ${cities.join(", ")}");
  });
}

void listenToRealtimeUpdates_listenForUpdates() async {
  final docRef = db.collection("cities").doc("SF");
  docRef.snapshots().listen((event) => print("Current data : ${event.data()}"),
      onError: (error) => print("Listen failed: $error"));
}
