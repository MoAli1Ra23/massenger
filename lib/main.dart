import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:massenger/features/authentication/presentation/page/create_account_page.dart';
import 'package:massenger/man.dart';

  
void main() {
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
      home: const CreateAccountPage(),
    );
  }
}

final x = ChangeNotifierProvider<Man>((ref) => Man());
