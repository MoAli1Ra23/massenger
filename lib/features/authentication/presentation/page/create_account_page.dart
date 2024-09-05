import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:massenger/core/func/erro_massegs.dart';
import 'package:massenger/core/utils/my_assets.dart';
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
                autovalidateMode: ref.watch(cac).showErr
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16)),
                        child: Image.asset(MyAssets.logo)),
                    TextFormField(
                      onChanged: (email) =>
                          ref.read(cac.notifier).emailChange(email),
                      validator: (_) =>
                          failureToText(ref.watch(cac).email.failure),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onChanged: (password) =>
                          ref.read(cac.notifier).passChange(password),
                      validator: (_) =>
                          failureToText(ref.watch(cac).password.failure),
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
