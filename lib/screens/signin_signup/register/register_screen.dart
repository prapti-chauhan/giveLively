// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:givelivly_beta/Screens/signin_signup/register/register_provider.dart';
import 'package:givelivly_beta/config/packages.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Material(
      child: Container(
          height: size.height,
          width: size.width,
          color: ColorsDesign.lightColor,
          child: Column(children: [
            SizedBox(
              height: size.height * 0.52,
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
                    top: size.height * 0.25,
                    right: size.width * 0.12,
                    child: Text(
                      "Create",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.amiri().fontFamily,
                        color: ColorsDesign.darkBluishColor,
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.29,
                    right: size.width * 0.08,
                    child: Text(
                      "Account",
                      style: TextStyle(
                        fontSize: 48,
                        fontFamily: GoogleFonts.amiri().fontFamily,
                        color: ColorsDesign.darkBluishColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                    child: Form(
                      key: context.read<RegisterProvider>().formStateKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: context
                                .read<RegisterProvider>()
                                .emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This field can't be empty";
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: TextStyle(
                                fontSize: 22,
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
                                .read<RegisterProvider>()
                                .passwordController,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This field can't be empty";
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                fontSize: 22,
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
                          SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      context
                                          .read<RegisterProvider>()
                                          .onRegister(context);
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Sign Up",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: ColorsDesign.darkBluishColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.05,
                                        ),
                                        Material(
                                          elevation: 10,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color:
                                                  ColorsDesign.darkBluishColor,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: const Icon(
                                              Icons.arrow_forward,
                                              size: 35,
                                              color: ColorsDesign.lightColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "Have An Account ?",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color:
                                                ColorsDesign.darkBluishColor),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen(),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          "Sign In",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: ColorsDesign.darkBluishColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ])),
    ));
  }
}
