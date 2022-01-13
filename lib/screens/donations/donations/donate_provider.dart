import 'package:givelivly_beta/config/packages.dart';

class DonateProvider extends ChangeNotifier {
  Stream? donation;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isRequested = true;

  init() {
    FireStoreMethods().getRequests().then((value) {
      donation = value;
      notifyListeners();
    });
    notifyListeners();
  }

  Map<String, dynamic> requestInfoMap = {
    'isRequested': true,
  };


  onRequest(){
    FireStoreMethods().addRequest(requestInfoMap).then((value) {
      Map<String, dynamic> lastRequestInfoMap = {
        "isRequested": true,

      };

      FireStoreMethods().updateLastRequestSend(lastRequestInfoMap);
      notifyListeners();
    });
  }
}
