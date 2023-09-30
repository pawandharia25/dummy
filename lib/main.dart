import 'package:demo_1/arriving_soon_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import 'package:firebase_core/firebase_core.dart';

Future main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);

  runApp( MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(480, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Pikkar App',
            // theme: ThemeData(
            //   primarySwatch: Colors.grey,
            //   inputDecorationTheme: const InputDecorationTheme(
            //     hintStyle: TextStyle(color: Colors.grey),
            //     labelStyle: TextStyle(color: Colors.grey),
            //   ),
              
            // ),

            darkTheme: ThemeData.dark(), // standard dark theme
            themeMode: ThemeMode.system,
            // theme: ThemeData.dark(),
            home: ArrivingSoonScreen(),
          );
        });
  }
}
