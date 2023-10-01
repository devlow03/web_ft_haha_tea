import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_ft_milk_tea/src/screen/main/main_view.dart';

import 'src/core/dependency_injection.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Milktea',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainPage(),
    );
  }
}


