import 'package:admin_panel/constants/theme.dart';
import 'package:admin_panel/helpers/firebase_options/firebase_options.dart';
import 'package:admin_panel/provider/app_provider.dart';
import 'package:admin_panel/screens/home_page/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
      create: (context) => AppProvider()
        ..getUserListFun()
        ..getCategoriesListFun(),
      child: MaterialApp(
        title: 'Viva Store - Admin',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: const HomePage(),
      ),
    );
  }
}
