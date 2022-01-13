import 'package:givelivly_beta/Screens/donations/add_donations/add_donation_screen.dart';
import 'package:givelivly_beta/Screens/donations/donations/donate_provider.dart';
import 'package:givelivly_beta/Screens/donations/donation_requests/donation_request_screen.dart';

import 'package:givelivly_beta/config/packages.dart';
import 'package:provider/provider.dart';

import '../../../customs/custom_donation_widget.dart';

class DonateScreen extends StatefulWidget {
  const DonateScreen({Key? key}) : super(key: key);

  @override
  _DonateScreenState createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  @override
  void initState() {
    context.read<DonateProvider>().init();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
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
              child: Text(
                "Donations Receive Requests",
                style: TextStyle(fontSize: 24, color: ColorsDesign.lightColor),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DonationRequestScreen(),
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
              context
                  .read<DonateProvider>()
                  .scaffoldKey
                  .currentState!
                  .openDrawer();
            },
          ),
          backgroundColor: ColorsDesign.lightColor,
        ),
        drawer: const NewCustomDrawer(),
        body: Container(
          color: ColorsDesign.lightColor,
          // height: 1000,
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
                            color: ColorsDesign.darkBluishColor, fontSize: 24),
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddDonateScreen(),
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
              Consumer<DonateProvider>(builder: (_, context, __) {
                return StreamBuilder(
                  stream: context.donation,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (context.read<DonateProvider>().donation == null) {
                      return const Center(
                        child: Text('No Donations Found'),
                      );
                    }
                    QuerySnapshot<Map<String, dynamic>> _data;
                    print('---${snapshot.data}---');
                    if (snapshot.hasData) {
                      _data =
                          snapshot.data as QuerySnapshot<Map<String, dynamic>>;
                      // setState(() {});
                      print("--------${_data.docs.length}");
                      return Expanded(
                        child: ListView.builder(
                            itemCount: _data.docs.length,
                            itemBuilder: (context, index) {
                              var _ds = _data.docs[index].data();

                              return CustomDonationWidget(
                                foodItem: 'Daal Khichdi',
                                donorName: _ds['fullName'],
                                address: _ds['address'],
                                number: '9988776655',
                                imageUrl: 'assets/Drawables/Biryani.jpg',
                                request: (_ds['isRequested'] ?? false)
                                    ? 'requested'
                                    : 'request',
                                onRequested: () {
                                  context.read<DonateProvider>().onRequest();
                                },
                              );
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
      ),
    );
  }
}
