import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:metbuy/views/auth_screen/login_screen.dart';
import 'package:metbuy/views/home_screen/home.dart';

import 'const/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var isLoggedin = false;

  @override
  void initState() {
    super.initState();
    checkUser(); // Move checkUser() call here
  }

  checkUser() async {
    auth.authStateChanges().listen((User? user) {
      setState(() {
        isLoggedin = user != null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      home: isLoggedin ? const Home() : const LoginScreen(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
      ),
    );
  }
}
