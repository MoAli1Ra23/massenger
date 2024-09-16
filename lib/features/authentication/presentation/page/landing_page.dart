import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:massenger/features/authentication/presentation/page/create_account_page.dart';
import 'package:massenger/features/authentication/presentation/providers/auth_manger.dart';
import 'package:massenger/features/chat/presentation/pages/chats_page.dart';

var auth = StateNotifierProvider<AuthManger, AuthState>((ref) => AuthManger());

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
  return  Consumer(
      builder: (context, ref, child) {
        ref.read(auth.notifier).checkAutheState();
        ref.listen(auth, (_, auth) {
          if (auth.user != null) {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return const ChatsPage();
            }));
           


          }
          else {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return const CreateAccountPage();
            }));
           
          }
        });
      return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
      },
    );
     
  }
}
