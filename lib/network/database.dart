import 'package:givelivly_beta/config/packages.dart';

class FireStoreMethods {
  Future addUserInfoToDB(
      String userId, Map<String, dynamic> userInfoMap) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userInfoMap);
  }

  Future addDonorInfoToDB(Map<String, dynamic> donorInfoMap) async {
    return FirebaseFirestore.instance
        .collection("donor")
        .doc()
        .set(donorInfoMap);
  }

  Future<Stream<QuerySnapshot>> getRequests() async {
    return FirebaseFirestore.instance.collection("donor").snapshots();
  }

  Future addRequest(Map<String, dynamic> requestInfoMap) async {
    return FirebaseFirestore.instance
        .collection("donor")
        .doc()
        .collection('requests')
        .doc()
        .set(requestInfoMap);
  }

  Future<Stream<QuerySnapshot>> getDonorInfo() async {
    return FirebaseFirestore.instance.collection("requests").snapshots();
  }

  updateLastRequestSend(Map<String, dynamic> lastRequestInfoMap) {
    return FirebaseFirestore.instance
        .collection("donor")
        .doc()
        .collection('requests')
        .doc()
        .update(lastRequestInfoMap);
  }
}
