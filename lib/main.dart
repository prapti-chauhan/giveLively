import 'package:firebase_core/firebase_core.dart';
import 'package:givelivly_beta/Screens/donations/add_donations/add_donation_provider.dart';
import 'package:givelivly_beta/Screens/donations/donations/donate_provider.dart';
import 'package:givelivly_beta/Screens/signin_signup/login/login_provider.dart';
import 'package:givelivly_beta/Screens/signin_signup/register/register_provider.dart';
import 'package:givelivly_beta/config/packages.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  GetStorage.init();

  runApp(MultiProvider(
      providers: [
        Provider<RegisterProvider>(create: (_) => RegisterProvider()),
        Provider<LoginProvider>(create: (_) => LoginProvider()),
        Provider<AddDonationProvider>(create: (_) => AddDonationProvider()),
        Provider<DonateProvider>(create: (_) => DonateProvider()),

      ],
      child: const MaterialApp(
        home: GiveLivly(),
        debugShowCheckedModeBanner: false,
      )));
}

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
