import 'package:givelivly_beta/config/packages.dart';

class Prefs {
  static String userIdKey = "USERKEY";
  static String userNameKey = "USERNAMEKEY";
  static String addressKey = "USERDISPLAYNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String donorNameKey = "DONORNAMEKEY";
  static String donorIdKey = "DONORKEY";

  GetStorage getx = GetStorage();

  //save

  set saveUserName(String getUserName) => getx.write(userNameKey, getUserName);

  set saveUserEmail(String getUserEmail) =>
      getx.write(userEmailKey, getUserEmail);

  set saveUserId(String getUserId) => getx.write(userIdKey, getUserId);

  set saveDonorId(String getDonorId) => getx.write(donorIdKey, getDonorId);

  set saveAddress(String getAddress) => getx.write(addressKey, getAddress);

  set saveDonorName(String getUserName) =>
      getx.write(donorNameKey, getUserName);

  // get data

  String get getUserName => getx.read(userNameKey) ?? '';

  String get getUserEmail => getx.read(userEmailKey) ?? '';

  String get getUserId => getx.read(userIdKey) ?? '';

  String get getDonorId => getx.read(donorIdKey) ?? '';

  String get getAddress => getx.read(addressKey) ?? '';

  String get getDonorName => getx.read(donorNameKey) ?? '';

  signOut() async {
    getx.erase();
    await FirebaseAuth.instance.signOut();
  }
}
