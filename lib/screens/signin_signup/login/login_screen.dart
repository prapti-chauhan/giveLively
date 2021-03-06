// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:givelivly_beta/Screens/donations/donations/donate_screen.dart';
import 'package:givelivly_beta/Screens/signin_signup/login/login_provider.dart';
import 'package:givelivly_beta/config/packages.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void checkLogin() async {
    final isLoggedIn = checkUser();
    if (isLoggedIn) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      });
    }
  }

  bool checkUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return true;
    }
    return false;
  }

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: Container(
        height: size.height,
        width: size.width,
        color: ColorsDesign.lightColor,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.45,
              child: Stack(
                children: [
                  Positioned(
                    top: size.height * 0,
                    right: size.width * 0,
                    child: Image.asset("assets/Drawables/Ellipse_26.png"),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset(
                      'assets/Drawables/Subtract.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.2,
                    left: size.width * 0.12,
                    child: Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.amiri().fontFamily,
                        color: ColorsDesign.lightColor,
                        shadows: [
                          const Shadow(
                            blurRadius: 10,
                            color: ColorsDesign.darkColor,
                            offset: Offset(3, 4),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.13,
                    left: size.width * 0.1,
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 48,
                        fontFamily: GoogleFonts.amiri().fontFamily,
                        color: ColorsDesign.lightColor,
                        shadows: [
                          const Shadow(
                            blurRadius: 10,
                            color: ColorsDesign.darkColor,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: loginKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller:
                            context.read<LoginProvider>().loginEmailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can't be empty";
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontSize: 24,
                            fontFamily: GoogleFonts.amiri().fontFamily,
                            fontWeight: FontWeight.bold,
                            color: ColorsDesign.darkBluishColor,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 3.0,
                              color: ColorsDesign.darkBluishColor,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 3.0,
                              color: ColorsDesign.darkBluishColor,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: context
                            .read<LoginProvider>()
                            .loginPasswordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can't be empty";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontSize: 24,
                            fontFamily: GoogleFonts.amiri().fontFamily,
                            fontWeight: FontWeight.bold,
                            color: ColorsDesign.darkBluishColor,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 3.0,
                              color: ColorsDesign.darkBluishColor,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 3.0,
                              color: ColorsDesign.darkBluishColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      InkWell(
                        onTap: () {
                          if (loginKey.currentState!.validate()) {
                            context.read<LoginProvider>().onSignIn(context);
                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.bold,
                                color: ColorsDesign.darkBluishColor,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: ColorsDesign.darkBluishColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                                size: 35,
                                color: ColorsDesign.lightColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Don't Have Account ?",
                            style: TextStyle(
                                fontSize: 22,
                                color: ColorsDesign.darkBluishColor),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                            width: size.width * 0.02,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: ColorsDesign.darkBluishColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
