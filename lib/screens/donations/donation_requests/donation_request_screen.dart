import 'package:givelivly_beta/Screens/donations/donation_requests/donation_request_provider.dart';
import 'package:givelivly_beta/config/packages.dart';
import 'package:givelivly_beta/customs/custom_request_widget.dart';
import 'package:provider/provider.dart';

class DonationRequestScreen extends StatefulWidget {
  const DonationRequestScreen({Key? key}) : super(key: key);

  @override
  _DonationRequestScreenState createState() => _DonationRequestScreenState();
}

var scaffoldKey = GlobalKey<ScaffoldState>();

class _DonationRequestScreenState extends State<DonationRequestScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
            child: const SizedBox(
              height: 70,
              width: 300,
              child: Center(
                child: Text(
                  "Donations Receive Requests",
                  style:
                      TextStyle(fontSize: 24, color: ColorsDesign.lightColor),
                ),
              ),
            ),
            onPressed: null,
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
        drawer: NewCustomDrawer(),
        body: Container(
          color: ColorsDesign.lightColor,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                // height: size.height * 0.65,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      //donation post
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
                                  top: 40,
                                  right: 30,
                                  child: SizedBox(
                                    height: 100,
                                    width: 100,
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
                                const Positioned(
                                  child: Divider(
                                    color: ColorsDesign.darkBluishColor,
                                    thickness: 3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //volunteers
                      Consumer<DonationRequestScreenProvider>(
                          builder: (_, context, __) {
                        return StreamBuilder(
                          stream: context.requests,
                          builder: (context, snapshot) {
                            if (context
                                    .read<DonationRequestScreenProvider>()
                                    .requests ==
                                null) {
                              return const Center(
                                child: Text('No Donations Found'),
                              );
                            }
                            QuerySnapshot<Map<String, dynamic>> _data;
                            print('---${snapshot.data}---');
                            if (snapshot.hasData) {
                              _data = snapshot.data
                                  as QuerySnapshot<Map<String, dynamic>>;
                              print("--------${_data.docs.length}");
                              return Expanded(
                                child: ListView.builder(
                                    itemCount: _data.docs.length,
                                    itemBuilder: (context, index) {
                                      // var _ds = _data.docs[index].data();
                                      return const CustomRequestWidget();
                                    }),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        );
                      })
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
