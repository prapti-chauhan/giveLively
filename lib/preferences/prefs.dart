import 'package:givelivly_beta/config/packages.dart';

class Prefs {
  static String userIdKey = "USERKEY";
  static String userNameKey = "USERNAMEKEY";
  static String displayNameKey = "USERDISPLAYNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userProfilePicKey = "USERPROFILEPICKEY";

  GetStorage getx = GetStorage();

  //save

  set saveUserName(String getUserName) => getx.write(userNameKey, getUserName);


  set saveUserEmail(String getUserEmail) => getx.write(userEmailKey, getUserEmail);


  set saveUserId(String getUserId) => getx.write(userIdKey, getUserId);


  set saveDisplayName(String getDisplayName) => getx.write(displayNameKey, getDisplayName);


  // get data

  String get getUserName => getx.read(userNameKey) ?? '';


  String get getUserEmail => getx.read(userEmailKey) ?? '';

  String get getUserId => getx.read(userIdKey) ?? '';

  String get getDisplayName => getx.read(displayNameKey) ?? '';


  signOut() async{
    getx.erase();
    await FirebaseAuth.instance.signOut();
  }


}
