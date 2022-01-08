import 'package:givelivly_beta/Screens/donations/donation_request_screen.dart';

import 'package:givelivly_beta/config/packages.dart';

class DonateScreen extends StatefulWidget {
  const DonateScreen({Key? key}) : super(key: key);

  @override
  _DonateScreenState createState() => _DonateScreenState();
}

var scaffoldKey = GlobalKey<ScaffoldState>();

class _DonateScreenState extends State<DonateScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        bottomNavigationBar: BottomAppBar(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(ColorsDesign.darkBluishColor),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
              ),
            ),
            child: SizedBox(
              height: size.height * 0.06,
              width: size.width,
              child: const Center(
                child: Text(
                  "Donations Receive Requests",
                  style:
                      TextStyle(fontSize: 24, color: ColorsDesign.lightColor),
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DonationRequestScreen(),
                ),
              );
            },
          ),
        ),
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications,
                  color: ColorsDesign.darkBluishColor),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
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
        drawer: const NewCustomDrawer(),
        body: Container(
          color: ColorsDesign.lightColor,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 380,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 15,
                      primary: ColorsDesign.darkGreenCreamColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Add Donations",
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
                            Icons.add,
                            color: ColorsDesign.creamColor,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Your Active Donations",
                    style: TextStyle(
                        fontSize: 24, color: ColorsDesign.darkBluishColor),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: size.height * 0.65,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Card(
                            elevation: 6,
                            margin: const EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              height: 200,
                              width: size.width,
                              decoration: BoxDecoration(
                                color: ColorsDesign.creamColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  const Positioned(
                                    top: 50,
                                    left: 20,
                                    child: Text(
                                      'Dal Khichadi',
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: ColorsDesign.darkBluishColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Positioned(
                                    top: 90,
                                    left: 20,
                                    child: Text(
                                      'Shyamlal Kaniyawalla',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: ColorsDesign.darkBluishColor),
                                    ),
                                  ),
                                  Positioned(
                                    top: 120,
                                    left: 20,
                                    child: SizedBox(
                                      width: size.width * 0.7,
                                      child: const Text(
                                        '201-202 Imagiera heights, Vesu, Surat',
                                        style: TextStyle(
                                            fontSize: 16,
                                            wordSpacing: 1,
                                            color: ColorsDesign.darkBluishColor),
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    bottom: 10,
                                    left: 20,
                                    child: Text(
                                      '9988776655',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: ColorsDesign.darkBluishColor),
                                    ),
                                  ),
                                  Positioned(
                                    top: 30,
                                    right: 10,
                                    child: SizedBox(
                                      height: 90,
                                      width: 90,
                                      child: CircleAvatar(
                                        backgroundImage: Image.asset(
                                          'assets/Drawables/Biryani.jpg',
                                          fit: BoxFit.fill,
                                        ).image,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(3.0),
                                        shape: MaterialStateProperty.all(
                                          const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(20),
                                            ),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                ColorsDesign.darkBluishColor),
                                      ),
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          top: 7,
                                          bottom: 7,
                                        ),
                                        child: const Text(
                                          "Request",
                                          style: TextStyle(
                                              color: ColorsDesign.lightColor,
                                              fontSize: 18),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Card(
                            elevation: 6,
                            margin: const EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              height: 200,
                              width: size.width,
                              decoration: BoxDecoration(
                                color: ColorsDesign.creamColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  const Positioned(
                                    top: 50,
                                    left: 20,
                                    child: Text(
                                      'Dal Khichadi',
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: ColorsDesign.darkBluishColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Positioned(
                                    top: 90,
                                    left: 20,
                                    child: Text(
                                      'Shyamlal Kaniyawalla',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: ColorsDesign.darkBluishColor),
                                    ),
                                  ),
                                  Positioned(
                                    top: 120,
                                    left: 20,
                                    child: SizedBox(
                                      width: size.width * 0.7,
                                      child: const Text(
                                        '201-202 Imagiera heights, Vesu, Surat',
                                        style: TextStyle(
                                            fontSize: 16,
                                            wordSpacing: 1,
                                            color: ColorsDesign.darkBluishColor),
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    bottom: 10,
                                    left: 20,
                                    child: Text(
                                      '9988776655',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: ColorsDesign.darkBluishColor),
                                    ),
                                  ),
                                  Positioned(
                                    top: 30,
                                    right: 10,
                                    child: SizedBox(
                                      height: 90,
                                      width: 90,
                                      child: CircleAvatar(
                                        backgroundImage: Image.asset(
                                          'assets/Drawables/Biryani.jpg',
                                          fit: BoxFit.fill,
                                        ).image,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(3.0),
                                        shape: MaterialStateProperty.all(
                                          const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(20),
                                            ),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                ColorsDesign.darkBluishColor),
                                      ),
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          top: 7,
                                          bottom: 7,
                                        ),
                                        child: const Text(
                                          "Request",
                                          style: TextStyle(
                                              color: ColorsDesign.lightColor,
                                              fontSize: 18),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Card(
                            elevation: 6,
                            margin: const EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              height: 200,
                              width: size.width,
                              decoration: BoxDecoration(
                                color: ColorsDesign.creamColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  const Positioned(
                                    top: 50,
                                    left: 20,
                                    child: Text(
                                      'Dal Khichadi',
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: ColorsDesign.darkBluishColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Positioned(
                                    top: 90,
                                    left: 20,
                                    child: Text(
                                      'Shyamlal Kaniyawalla',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: ColorsDesign.darkBluishColor),
                                    ),
                                  ),
                                  Positioned(
                                    top: 120,
                                    left: 20,
                                    child: SizedBox(
                                      width: size.width * 0.7,
                                      child: const Text(
                                        '201-202 Imagiera heights, Vesu, Surat',
                                        style: TextStyle(
                                            fontSize: 16,
                                            wordSpacing: 1,
                                            color: ColorsDesign.darkBluishColor),
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    bottom: 10,
                                    left: 20,
                                    child: Text(
                                      '9988776655',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: ColorsDesign.darkBluishColor),
                                    ),
                                  ),
                                  Positioned(
                                    top: 30,
                                    right: 10,
                                    child: SizedBox(
                                      height: 90,
                                      width: 90,
                                      child: CircleAvatar(
                                        backgroundImage: Image.asset(
                                          'assets/Drawables/Biryani.jpg',
                                          fit: BoxFit.fill,
                                        ).image,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(3.0),
                                        shape: MaterialStateProperty.all(
                                          const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(20),
                                            ),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                ColorsDesign.darkBluishColor),
                                      ),
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          top: 7,
                                          bottom: 7,
                                        ),
                                        child: const Text(
                                          "Request",
                                          style: TextStyle(
                                              color: ColorsDesign.lightColor,
                                              fontSize: 18),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Card(
                            elevation: 6,
                            margin: const EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              height: 200,
                              width: size.width,
                              decoration: BoxDecoration(
                                color: ColorsDesign.creamColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  const Positioned(
                                    top: 50,
                                    left: 20,
                                    child: Text(
                                      'Dal Khichadi',
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: ColorsDesign.darkBluishColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Positioned(
                                    top: 90,
                                    left: 20,
                                    child: Text(
                                      'Shyamlal Kaniyawalla',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: ColorsDesign.darkBluishColor),
                                    ),
                                  ),
                                  Positioned(
                                    top: 120,
                                    left: 20,
                                    child: SizedBox(
                                      width: size.width * 0.7,
                                      child: const Text(
                                        '201-202 Imagiera heights, Vesu, Surat',
                                        style: TextStyle(
                                            fontSize: 16,
                                            wordSpacing: 1,
                                            color: ColorsDesign.darkBluishColor),
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    bottom: 10,
                                    left: 20,
                                    child: Text(
                                      '9988776655',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: ColorsDesign.darkBluishColor),
                                    ),
                                  ),
                                  Positioned(
                                    top: 30,
                                    right: 10,
                                    child: SizedBox(
                                      height: 90,
                                      width: 90,
                                      child: CircleAvatar(
                                        backgroundImage: Image.asset(
                                          'assets/Drawables/Biryani.jpg',
                                          fit: BoxFit.fill,
                                        ).image,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(3.0),
                                        shape: MaterialStateProperty.all(
                                          const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(20),
                                            ),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                ColorsDesign.darkBluishColor),
                                      ),
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                          top: 7,
                                          bottom: 7,
                                        ),
                                        child: const Text(
                                          "Request",
                                          style: TextStyle(
                                              color: ColorsDesign.lightColor,
                                              fontSize: 18),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
