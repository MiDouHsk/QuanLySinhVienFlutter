import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quanlysinhvien/model/profile.dart';
import 'package:quanlysinhvien/providers/loginviewmodel.dart';
import 'package:quanlysinhvien/providers/registerviewmodel.dart';
import 'ui/page_login.dart';
import 'ui/page_main.dart';
import 'ui/page_register.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Profile profile = Profile();
  profile.initialize();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<LoginViewModel>(
      create: (context) => LoginViewModel(),
    ),
    ChangeNotifierProvider<RegisterViewModel>(
      create: (context) => RegisterViewModel(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => PageMain(),
        '/login': (context) => PageLogin(),
        '/register': (context) => PageRegister()
      },
      title: "Quản Lý Sinh Viên",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: PageLogin(),
    );
  }
}
