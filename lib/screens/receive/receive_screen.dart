import 'package:givelivly_beta/config/packages.dart';
import 'package:givelivly_beta/customs/custom_donation_widget.dart';
import 'package:givelivly_beta/screens/receive/receive_provider.dart';
import 'package:provider/provider.dart';

class ReceiveScreen extends StatefulWidget {
  const ReceiveScreen({Key? key}) : super(key: key);

  @override
  _ReceiveScreenState createState() => _ReceiveScreenState();
}

var scafoldKey = GlobalKey<ScaffoldState>();

class _ReceiveScreenState extends State<ReceiveScreen> {
  @override
  void initState() {
    context.read<ReceiveProvider>().init();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: scafoldKey,
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
                  "Receive Requests",
                  style:
                      TextStyle(fontSize: 24, color: ColorsDesign.lightColor),
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReceiveRequestScreen(),
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
              scafoldKey.currentState!.openDrawer();
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
                width: size.width,
              ),
              Center(
                  child: Text(
                "All Donations",
                style: TextStyle(
                    color: ColorsDesign.darkBluishColor, fontSize: 24),
              )),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<ReceiveProvider>(builder: (_, context, __) {
                return StreamBuilder(
                  stream: context.donation,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (context.read<ReceiveProvider>().donation == null) {
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
                                foodItem: _ds['itemName'],
                                foodType: _ds['itemType'],
                                donorName: _ds['fullName'],
                                address: _ds['address'],
                                number: _ds['phoneNumber'],
                                imageUrl: 'assets/Drawables/Biryani.jpg',
                                request: (_ds['isRequested'] ?? false)
                                    ? 'requested'
                                    : 'request',
                                onRequested: () {
                                  context.read<ReceiveProvider>().onRequest();
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
