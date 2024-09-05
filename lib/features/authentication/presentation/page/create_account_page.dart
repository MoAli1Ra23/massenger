import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:massenger/features/authentication/presentation/providers/create_account_provider.dart';

final cac = StateNotifierProvider<CreateAccountProvider, CreateAccount>((ref) {
  return CreateAccountProvider();
});

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Consumer(
            builder: (context, ref, child) => Form(
                child: Column(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16 )),
                    child: Image.asset("assets/images/chatlogo.png")),
                TextFormField(
                  onChanged: (email) =>
                      ref.read(cac.notifier).emailChange(email),
                  validator: (_) => ref.watch(cac).email.right,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (password) =>
                      ref.read(cac.notifier).passChange(password),
                  validator: (_) => ref.watch(cac).password.right,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () => ref.read(cac.notifier).onSub(),
                    child: child)
              ],
            )),
          ),
        ));
  }
}
