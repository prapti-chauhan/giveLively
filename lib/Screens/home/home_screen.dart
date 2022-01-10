import 'package:givelivly_beta/Screens/donations/donations/donate_screen.dart';
import 'package:givelivly_beta/Screens/notification/notification.dart';
import 'package:givelivly_beta/config/packages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.notifications,
                    color: ColorsDesign.darkBluishColor),
                tooltip: 'Show snackbar',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationScreen()));
                },
              ),
            ],
            elevation: 0,
            leading: IconButton(
              icon: SvgPicture.asset('assets/Drawables/Toggle Button.svg'),
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
            ),
            backgroundColor: ColorsDesign.lightColor,
          ),
          body: Container(
            height: size.height,
            width: size.width,
            color: ColorsDesign.lightColor,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: size.width * 0.1,
                  child: const Text(
                    "Help Making Society",
                    style: TextStyle(
                      fontSize: 36,
                      color: ColorsDesign.darkBluishColor,
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.05,
                  left: size.width * 0.1,
                  child: const Text(
                    "Better Place",
                    style: TextStyle(
                      fontSize: 24,
                      color: ColorsDesign.darkBluishColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  //top: size.height * 0.15,
                  right: 0,
                  left: 0,
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    //height: size.height * 0.3,
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: ColorsDesign.darkGreenCreamColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 410,
                  height: 170,
                  left: 30,
                  right: 30,
                  child: Material(
                    elevation: 7,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: ColorsDesign.darkerGreenCreamColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      // height: 480,
                      width: 300,
                      child: const Text('. . . .',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 4,
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                            color: ColorsDesign.darkBluishColor,
                          )),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SvgPicture.asset(
                    'assets/Drawables/Ellipse 19.svg',
                    height: 260,
                  ),
                ),
                const Positioned(
                  bottom: 360,
                  left: 170,
                  child: Text(
                    "Lets Make Someone",
                    // textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 22, color: ColorsDesign.darkBluishColor),
                  ),
                ),
                const Positioned(
                  bottom: 310,
                  left: 250,
                  child: Text(
                    "Happy",
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: ColorsDesign.darkBluishColor),
                  ),
                ),
                Positioned(
                    bottom: 200,
                    left: 30,
                    right: 30,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                          width: 320,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DonateScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10))),
                                  primary: ColorsDesign.lightColor,
                                  padding:
                                  const EdgeInsets.only(left: 80, right: 50),
                                  elevation: 15),
                              child: Row(
                                children: [
                                  const Text(
                                    'Donate',
                                    style: TextStyle(
                                        color: ColorsDesign.darkBluishColor,
                                        fontSize: 30),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Ink(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorsDesign.darkBluishColor),
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      color: ColorsDesign.creamColor,
                                    ),
                                  ),
                                ],
                              )),
                        )
                      ],
                    )),
                Positioned(
                    bottom: 110,
                    left: 30,
                    right: 30,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                          width: 320,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))),
                                elevation: 15,
                                primary: ColorsDesign.lightColor,
                                padding: const EdgeInsets.only(left: 80, right: 50),
                              ),
                              child: Row(
                                children: [
                                  Ink(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorsDesign.darkBluishColor),
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      color: ColorsDesign.creamColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Text(
                                    'Receive',
                                    style: TextStyle(
                                        color: ColorsDesign.darkBluishColor,
                                        fontSize: 30),
                                  ),
                                ],
                              )),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
