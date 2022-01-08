

import 'package:givelivly_beta/config/packages.dart';


void main() => runApp(const GiveLivly());

class GiveLivly extends StatelessWidget {
  const GiveLivly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GiveLivly',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.welcomeRoute,
      theme: ThemeData(
          textTheme: GoogleFonts.amiriTextTheme(
        Theme.of(context).textTheme,
      )),
      routes: {
        Routes.welcomeRoute: (context) => const WelcomeScreen(),
        Routes.homeRoute: (context) => const HomeScreen(),
        Routes.loginRoute: (context) => const LoginScreen(),
      },
    );
  }
}
