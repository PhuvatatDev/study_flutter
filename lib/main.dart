import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter/features/home/presentation/home_page.dart';
import 'package:study_flutter/firebase_options.dart';

void main() async {
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
    return MaterialApp(
        title: 'Study Flutter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(useMaterial3: true),
        home: const HomePage());
  }
}
