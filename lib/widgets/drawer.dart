// ignore_for_file: prefer_const_constructors

import 'package:givelivly_beta/config/packages.dart';

class NewCustomDrawer extends StatefulWidget {
  NewCustomDrawer({Key? key}) : super(key: key);

  @override
  State<NewCustomDrawer> createState() => _NewCustomDrawerState();
}

class _NewCustomDrawerState extends State<NewCustomDrawer> {
  final imageUrl =
      'https://images.unsplash.com/photo-1638061714820-ab12cbbeb87e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80';
  var user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData(
        textTheme: GoogleFonts.amiriTextTheme(
      Theme.of(context).textTheme,
    ));
    return Container(
      width: size.width * 0.7,
      decoration: const BoxDecoration(
        color: ColorsDesign.darkGreenCreamColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: ColorsDesign.darkGreenCreamColor,
            ),
            currentAccountPicture: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
              ),
              child: CircleAvatar(
                radius: 50.0,
                backgroundColor: ColorsDesign.darkBluishColor,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            accountName: Text(
              "${user?.email!.replaceAll('@gmail.com', '')}",
              style: TextStyle(
                color: ColorsDesign.darkBluishColor,
                fontSize: 24,
              ),
            ),
            accountEmail: Text(
              '${user?.email}',
              style: TextStyle(
                color: ColorsDesign.darkBluishColor,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: Divider(
              color: ColorsDesign.darkBluishColor,
              thickness: 2.0,
              height: 10.0,
            ),
          ),
          ExpansionTile(
            collapsedTextColor: ColorsDesign.darkBluishColor,
            textColor: ColorsDesign.darkBluishColor,
            collapsedIconColor: ColorsDesign.darkBluishColor,
            iconColor: ColorsDesign.darkBluishColor,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            title: const Text(
              "Donate",
              style: TextStyle(
                color: ColorsDesign.darkBluishColor,
                fontSize: 18,
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  "Add Donations",
                  style: TextStyle(
                    color: ColorsDesign.darkBluishColor,
                    fontSize: 14,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  "Donation Receive Requests",
                  style: TextStyle(
                      fontSize: 14, color: ColorsDesign.darkBluishColor),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  "Your Donations",
                  style: TextStyle(
                    color: ColorsDesign.darkBluishColor,
                    fontSize: 14,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          ExpansionTile(
            collapsedTextColor: ColorsDesign.darkBluishColor,
            textColor: ColorsDesign.darkBluishColor,
            collapsedIconColor: ColorsDesign.darkBluishColor,
            iconColor: ColorsDesign.darkBluishColor,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            title: Text(
              "Receive",
              style: TextStyle(
                color: ColorsDesign.darkBluishColor,
                fontSize: 18,
              ),
            ),
            children: <Widget>[
              ListTile(
                title: Text(
                  "Receive Donations",
                  style: TextStyle(
                    color: ColorsDesign.darkBluishColor,
                    fontSize: 14,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  "View Sended Requests",
                  style: TextStyle(
                    color: ColorsDesign.darkBluishColor,
                    fontSize: 14,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          ListTile(
            title: Text(
              "Address Book",
              style: TextStyle(
                color: ColorsDesign.darkBluishColor,
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ExpansionTile(
            title: Text(
              "Settings",
              style: TextStyle(
                color: ColorsDesign.darkBluishColor,
                fontSize: 18,
              ),
            ),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            expandedAlignment: Alignment.center,
            children: <Widget>[
              ListTile(
                trailing: Icon(Icons.logout),
                title: Text(
                  "Sign Out",
                  style: TextStyle(
                    color: ColorsDesign.darkBluishColor,
                    fontSize: 14,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 40,
              width: 40,
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: ColorsDesign.darkBluishColor,
              ),
              decoration: const BoxDecoration(shape: BoxShape.circle),
            ),
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(), primary: ColorsDesign.lightColor),
          ),
        ],
      ),
    );
  }
}
