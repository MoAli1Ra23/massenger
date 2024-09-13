import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:massenger/core/func/erro_massegs.dart';
import 'package:massenger/core/utils/my_assets.dart';
import 'package:massenger/features/authentication/presentation/providers/create_account_provider.dart';
import 'package:massenger/features/chat/presentation/pages/chats_page.dart';

final cac = StateNotifierProvider.autoDispose<CreateAccountProvider, CreateAccount>((ref) {
  return CreateAccountProvider();
});

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        // extendBody: ,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Consumer(
            builder: (context, ref, child) {
              ref.listen(cac, (_, cac) {
                if (cac.isSubmitted) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ChatsPage()));
                }
                if (cac.submittingFailure != null) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("erro")),
                  );
                }
              });

              return Form(
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
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(label: Text("email")),
                        onChanged: (email) =>
                            ref.read(cac.notifier).emailChange(email),
                        validator: (_) =>
                            failureToText(ref.watch(cac).email.failure),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration:
                            const InputDecoration(label: Text("password")),
                        onChanged: (password) =>
                            ref.read(cac.notifier).passChange(password),
                        validator: (_) =>
                            failureToText(ref.watch(cac).password.failure),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: () =>
                                  ref.read(cac.notifier).onSingUp(),
                              child: const Text("Sing UP")),
                          ElevatedButton(
                              onPressed: () =>
                                  ref.read(cac.notifier).onSingIn(),
                              child: const Text("Sing In")),
                        ],
                      )
                    ],
                  ));
            },
          ),
        ));
  }
}
