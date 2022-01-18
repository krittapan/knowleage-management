import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String username;

  const User(
      {required this.username,
      required this.uid,
      });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot["username"],
      uid: snapshot["uid"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
      };
}
