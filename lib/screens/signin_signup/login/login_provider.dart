import 'package:givelivly_beta/config/packages.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController loginPasswordController = TextEditingController();
  final TextEditingController loginEmailController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  bool isLoggedIn = false;

  onSignIn(BuildContext context) async {
    // if (loginKey?.currentState?.validate() ?? true) {
    late UserCredential user;
    try {
      print('--------------trying----------------');
      user = await _auth.signInWithEmailAndPassword(
          email: loginEmailController.text,
          password: loginPasswordController.text);

      Prefs().saveUserEmail = user.user!.email!;
      // print('${user.user!.email}');
      print('--${Prefs().getUserEmail}--');
      Prefs().saveUserId = user.user!.uid;
      Prefs().saveDonorName = user.user!.email!.replaceAll("@gmail.com", "");

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );

      loginPasswordController.clear();
      loginEmailController.clear();

      notifyListeners();
    } catch (signInError) {
      print('sign in error $signInError');
      /*
        print("----------------error---------------");
        if (signInError.toString() ==
                '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.' ||
            signInError.toString() ==
                '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.') {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('ERROR!'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/warning.png'),
                      const Text("Email or Password is INCORRECT!!")
                    ],
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Ok"),
                    )
                  ],
                );
              });
          email = '';
          password = '';
        }*/
    }
    // }
    print('-----------------end-----------------');
    notifyListeners();
  }
}
