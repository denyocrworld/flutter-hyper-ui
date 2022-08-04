import 'package:flutterx/data/session/app_session.dart';

class UserService {
  static saveCurrentUserData() async {
    userCollection.update({
      "name": "User Fugi",
      "email": currentUser.email,
    });
  }
}
