import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main()async{
  await Supabase.initialize(
    anonKey: "sb_publishable_O48pviWKYmTdCddPmXo2xA_TSqWoj0P",
    url: "https://spiovdifuhvlwtrxycoi.supabase.co",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const WelcomePage(),
    );
  }
}
