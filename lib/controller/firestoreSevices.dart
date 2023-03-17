import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

var bookmarks = [];

//create check is user is there
Future<void> checkUser(String email) async {
  bool isUserExist = false;

  firestore.collection("users").get().then((querySnapshot) {
    querySnapshot.docs.forEach((result) {
      if (result.data()["email"] == email) {
        print("Ini email ==============================");
        print(result.data()["email"]);
        isUserExist = true;
      }
    });
  }).whenComplete(() {
    if (isUserExist) {
      print("User is exist");
    } else {
      //add user
      print("User is not exist");
      firestore.collection("users").add({
        "email": email,
        "bookmarks": {},
      });
    }
  });
}

//create get bookmarks
Future<void> getBookmarks(String email) async {
  firestore.collection("users").get().then((querySnapshot) {
    querySnapshot.docs.forEach((result) {
      if (result.data()["email"] == email) {
        bookmarks = result.data()["bookmarks"];
      }
    });
  });
}

//create add bookmark
Future<void> addBookmark(String email, String idbookmars) async {
  firestore.collection("users").get().then((querySnapshot) {
    querySnapshot.docs.forEach((result) {
      if (result.data()["email"] == email) {
        List<dynamic> bookmarks =
            List.from(result.data()["bookmarks"] ?? []);
        bookmarks.add(idbookmars);
        firestore.collection("users").doc(result.id).update({
          "bookmarks": bookmarks,
        });
      }
    });
  });
}

//create remove bookmark
Future<void> removeBookmark(String email, String idbookmars) async {
  firestore.collection("users").get().then((querySnapshot) {
    querySnapshot.docs.forEach((result) {
      if (result.data()["email"] == email) {
        bookmarks = result.data()["bookmarks"];
        bookmarks.remove(idbookmars);
        firestore.collection("users").doc(result.id).update({
          "bookmarks": bookmarks,
        });
      }
    });
  });
}

//create get bookmarks
Future<bool> checkBookmark(String email, String idbookmars) async {
  bool isBookmarkExist = false;

  await firestore.collection("users").get().then((querySnapshot) {
    querySnapshot.docs.forEach((result) {
      if (result.data()["email"] == email) {
        List<dynamic> bookmarks =
            List.from(result.data()["bookmarks"] ?? []);
        if (bookmarks.contains(idbookmars)) {
          isBookmarkExist = true;
        }
      }
    });
  });

  return isBookmarkExist;
}

// get authorized user
String? auth() {
  final user = FirebaseAuth.instance.currentUser;
  String? email;
  if (user != null) {
    email = user.email;
  }
  return email;
}
