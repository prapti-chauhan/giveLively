// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:givelivly_beta/Screens/donations/donate_screen.dart';
import 'package:givelivly_beta/config/packages.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Material(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
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
                        height: size.height * 0.03,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Don't Have Account ?",
                            style: TextStyle(
                                fontSize: 18,
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
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(3.0),
                              backgroundColor: MaterialStateProperty.all(
                                  ColorsDesign.creamColor),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Donate",
                                  style: TextStyle(
                                      color: ColorsDesign.darkBluishColor,
                                      fontSize: 24),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Ink(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorsDesign.darkBluishColor),
                                  child: const Icon(
                                    Icons.arrow_forward,
                                    color: ColorsDesign.creamColor,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DonateScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
