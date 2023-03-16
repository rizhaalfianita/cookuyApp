import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

List<String> bookmarks = [];

//create check is user is there
Future<void> checkUser(String email) async {
  bool isUserExist = false;

  firestore.collection("users").get().then((querySnapshot) {
    querySnapshot.docs.forEach((result) {
      if (result.data()["email"] == email) {
        isUserExist = true;
      }
    });
  });

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
        bookmarks = result.data()["bookmarks"];
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
