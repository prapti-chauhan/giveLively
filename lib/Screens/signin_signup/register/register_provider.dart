// ignore_for_file: avoid_print

import 'package:givelivly_beta/config/packages.dart';

class RegisterProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formStateKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  onRegister(BuildContext context) async {
    final form = formStateKey.currentState!;
    UserCredential? user;
    if (form.validate()) {
      try {
        print('............trying..............');
        user = (await _auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text));

        Prefs().saveUserEmail = user.user!.email!;
        Prefs().saveUserId = user.user!.uid;
        Map<String, dynamic> userInfoMap = {
          "email": emailController.text,
        };

        FireStoreMethods()
            .addUserInfoToDB(user.user!.uid, userInfoMap)
            .then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                ));

        passwordController.clear();
        emailController.clear();

        notifyListeners();
      } catch (signUpError) {
        print('sigh up error $signUpError');
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('ERROR!'),
                content: const Text("Email already exist!!"),
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
        emailController.clear();
        passwordController.clear();
      }
      notifyListeners();
    }
  }
}
