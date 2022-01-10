import 'package:givelivly_beta/config/packages.dart';

class AddDonationProvider extends ChangeNotifier {
  final GlobalKey<FormState> formStateKeyDonation = GlobalKey<FormState>();
  TextEditingController addEmailCtrl = TextEditingController();
  TextEditingController addFullNameCtrl = TextEditingController();
  TextEditingController addAddressCtrl = TextEditingController();

  onAddDonation(BuildContext context) {

    if (formStateKeyDonation.currentState!.validate()) {
      Map<String, dynamic> donorInfoMap = {
        "email": addEmailCtrl.text,
        "fullName": addFullNameCtrl.text,
        "address": addAddressCtrl.text
      };

  /*    Prefs().saveDonorId = user!.user!.uid;
      Prefs().saveDonorName = addFullNameCtrl.text;
      Prefs().saveAddress = addAddressCtrl.text;*/

      FireStoreMethods()
          .addDonorInfoToDB(donorInfoMap)
          .then((value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              ));

      notifyListeners();
    }
  }
}
