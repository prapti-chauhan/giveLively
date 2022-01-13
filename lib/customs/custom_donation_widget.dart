import 'package:givelivly_beta/Screens/donations/donations/donate_screen.dart';
import 'package:givelivly_beta/config/packages.dart';

class CustomDonationWidget extends StatelessWidget {
  final String foodItem;
  final String donorName;
  final String address;
  final String number;
  final String imageUrl;
  final String request;
  final VoidCallback? onRequested;

  const CustomDonationWidget(
      {Key? key,
      required this.foodItem,
      required this.donorName,
      required this.address,
      required this.number,
      required this.imageUrl,
      required this.request, this.onRequested})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  Padding(
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
                Positioned(
                  top: 50,
                  left: 20,
                  child: Text(
                    foodItem,
                    style: const TextStyle(
                        fontSize: 24,
                        color: ColorsDesign.darkBluishColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 20,
                  child: Text(
                    donorName,
                    style: const TextStyle(
                        fontSize: 18, color: ColorsDesign.darkBluishColor),
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 20,
                  child: SizedBox(
                    width: size.width * 0.7,
                    child:  Text(
                      address,
                      style: const TextStyle(
                          fontSize: 16,
                          wordSpacing: 1,
                          color: ColorsDesign.darkBluishColor),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 20,
                  child: Text(
                    number,
                    style: const TextStyle(
                        fontSize: 18, color: ColorsDesign.darkBluishColor),
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
                        imageUrl,
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
                      backgroundColor: MaterialStateProperty.all(
                          ColorsDesign.darkBluishColor),
                    ),
                    child: InkWell(
                      onTap: onRequested ?? (){},
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 7,
                          bottom: 7,
                        ),
                        child:  Text(
                          request,
                          style: const TextStyle(
                              color: ColorsDesign.lightColor, fontSize: 18),
                        ),
                      ),
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
                ),
              ],
            ),
          ),
        ));
  }


}
