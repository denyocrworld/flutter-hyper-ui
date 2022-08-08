import 'package:flutterx/core.dart';

class UserService {
  static saveCurrentUserData() async {
    userCollection.update({
      "name": "User Fugi",
      "email": currentUser.email,
    });
  }
}
