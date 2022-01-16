import 'package:givelivly_beta/config/packages.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Material(
        color: ColorsDesign.lightColor,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                constraints: BoxConstraints(
                    minHeight: size.height * 1, minWidth: size.width * 1),
                child: Stack(
                  children: [
                    Container(
                      child: Image.asset("assets/Drawables/Ellipse1.png"),
                      width: double.infinity,
                      height: size.height * 0.3,
                      alignment: Alignment.topLeft,
                    ),
                    Positioned(
                      top: size.height * 0.1,
                      left: size.width * 0.15,
                      child: Text(
                        "GiveLivly",
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w900,
                          fontFamily: GoogleFonts.amiri().fontFamily,
                          color: ColorsDesign.darkBluishColor,
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.1,
                      left: size.width * 0,
                      child: SizedBox(
                        child: Image.asset(
                          'assets/Drawables/Illustrations1.png',
                        ),
                        height: size.height * 0.6,
                        width: size.width * 1,
                      ),
                    ),
                    Positioned(
                      bottom: size.height * 0,
                      right: size.width * 0,
                      child: SizedBox(
                        child: Image.asset('assets/Drawables/Ellipse4.png'),
                        height: size.height * 0.3,
                      ),
                    ),
                    Positioned(
                      bottom: size.height * 0.2,
                      right: size.width * 0.1,
                      child: Text(
                        "Helping Hands",
                        style: TextStyle(
                          fontSize: 42,
                          fontFamily: GoogleFonts.amiri().fontFamily,
                          color: ColorsDesign.darkBluishColor,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: size.height * 0.15,
                      right: size.width * 0.1,
                      child: Text(
                        "To Society",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.amiri().fontFamily,
                          color: ColorsDesign.darkBluishColor,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: size.height * 0.05,
                      left: size.width * 0.1,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          // ignore: prefer_const_constructors
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: ColorsDesign.lightColor,
                          ),
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: ColorsDesign.darkBluishColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
