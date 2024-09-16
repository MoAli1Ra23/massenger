import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:massenger/features/authentication/presentation/page/landing_page.dart';
import 'package:massenger/firebase_options.dart';
import 'package:massenger/injection.dart';
import 'package:massenger/man.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  configureDependencies(Environment.dev);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            displayMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            displaySmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            bodyLarge: TextStyle()),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const LandingPage(),
    );
  }
}

final x = ChangeNotifierProvider<Man>((ref) => Man());
