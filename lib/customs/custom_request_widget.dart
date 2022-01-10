import 'package:givelivly_beta/config/packages.dart';

class CustomRequestWidget extends StatelessWidget{
  const CustomRequestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Card(
      elevation: 6,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
          color: ColorsDesign.darkGreenCreamColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(children: const [
          Positioned(
            top: 20,
            left: 20,
            child: Text(
              'Dilip Joshi',
              style: TextStyle(
                  fontSize: 22,
                  color: ColorsDesign.darkBluishColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ]),
      ),
    ),
  );

  }
}