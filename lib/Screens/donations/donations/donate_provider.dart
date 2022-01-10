import 'package:givelivly_beta/config/packages.dart';

class DonateProvider extends ChangeNotifier {
  Stream? donation;
  List donations = [];
  var scaffoldKey = GlobalKey<ScaffoldState>();

  String fullName = '', address = '';

  init() {
    fullName = Prefs().getDonorName;
    address = Prefs().getAddress;

    FireStoreMethods().getDonorInfo().then((value) {
      donation = value;
      notifyListeners();
    });
    notifyListeners();
  }
}
