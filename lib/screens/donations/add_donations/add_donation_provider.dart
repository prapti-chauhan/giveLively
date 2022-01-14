import 'package:givelivly_beta/config/packages.dart';
import 'package:givelivly_beta/screens/donations/donations/donate_screen.dart';

class AddDonationProvider extends ChangeNotifier {
  final GlobalKey<FormState> formStateKeyDonation = GlobalKey<FormState>();
  TextEditingController addEmailCtrl = TextEditingController();
  TextEditingController addFullNameCtrl = TextEditingController();
  TextEditingController addAddressCtrl = TextEditingController();
  TextEditingController addItemNameCtrl = TextEditingController();
  TextEditingController addItemTypeCtrl = TextEditingController();
  TextEditingController addPhoneNoCtrl = TextEditingController();
  var user = FirebaseAuth.instance.currentUser;

  onAddDonation(BuildContext context) {
    if (formStateKeyDonation.currentState!.validate()) {
      Map<String, dynamic> donorInfoMap = {
        'doneby': user?.email,
        "itemName": addItemNameCtrl.text,
        "itemType": addItemTypeCtrl.text,
        'phoneNumber': addPhoneNoCtrl.text,
        "fullName": addFullNameCtrl.text,
        "address": addAddressCtrl.text,
        'isRequested': false,
        'emailArray': [],
        'timestamp': DateTime.now(),
      };

      onRequestDonation(BuildContext context) {}
      /*    Prefs().saveDonorId = user!.user!.uid;
      Prefs().saveDonorName = addFullNameCtrl.text;
      Prefs().saveAddress = addAddressCtrl.text;*/

      FireStoreMethods()
          .addDonorInfoToDB(donorInfoMap)
          .then((value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DonateScreen(),
                ),
              ));

      notifyListeners();
    }
  }
}
