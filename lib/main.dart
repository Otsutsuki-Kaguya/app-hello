

import 'package:app_hello/UI/page_forgot.dart';
import 'package:app_hello/UI/page_login.dart';
import 'package:app_hello/UI/page_main.dart';
import 'package:app_hello/UI/page_register.dart';
import 'package:app_hello/models/profile.dart';
import 'package:app_hello/providers/diachimodel.dart';
import 'package:app_hello/providers/forgotviewmodel.dart';
import 'package:app_hello/providers/loginviewmodel.dart';
import 'package:app_hello/providers/mainviewmodel.dart';
import 'package:app_hello/providers/menubarviewmodel.dart';
import 'package:app_hello/providers/profileviewmodel.dart';
import 'package:app_hello/providers/registerviewmodel.dart';
import 'package:app_hello/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ApiService api = ApiService();
  api.initialize();
  Profile profile = Profile();
  profile.initialize();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<LoginViewModel>(
        create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider<RegisterViewModel>(
        create: (context) => RegisterViewModel(),
        ),
        ChangeNotifierProvider<ForgotViewmodel>(
        create: (context) => ForgotViewmodel(),
        ),
        ChangeNotifierProvider<MainViewModel>(
        create: (context) => MainViewModel(),
        ),
        ChangeNotifierProvider<MenuBarViewModel>(
        create: (context) => MenuBarViewModel(),
        ),
         ChangeNotifierProvider<ProfileViewModel>(
        create: (context) => ProfileViewModel(),
        ),
        ChangeNotifierProvider<DiachiModel>(
        create: (context) => DiachiModel(),
        ),
    ],child:const MyApp()));
    
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/main':(context) =>  PageMain(),
        '/login':(context) => PageLogin(),
        '/register':(context) => PageRegister(),
        '/forgot':(context) => PageForgot(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 16)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home:  PageMain(),
    );
  }
}





