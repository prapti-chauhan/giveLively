import 'package:givelivly_beta/config/packages.dart';

class DonateProvider extends ChangeNotifier {
  Stream? donation;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isRequested = true;


  init() {

    FireStoreMethods().getDonorInfo().then((value) {
      donation = value;
      notifyListeners();
    });
    notifyListeners();
  }
}
