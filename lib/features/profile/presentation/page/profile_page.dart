import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:massenger/core/utils/my_assets.dart';
import 'package:massenger/features/authentication/presentation/page/landing_page.dart';
import 'package:massenger/features/profile/presentation/poviders/profile_manger.dart';

import 'profiel_edit_mode.dart';

var profile = StateNotifierProvider.autoDispose<ProfileManger, ProfileState>(
    (ref) => ProfileManger(const ProfileState()));

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          var x = ref.watch(profile);
          ref.read(profile.notifier).start();
          return Form(
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.hardEdge,
                    child: x.imageUrl != null
                        ? CachedNetworkImage(
                            placeholder: (context, _) =>
                                const CircularProgressIndicator(),
                            imageUrl: x.imageUrl!)
                        : Image.asset(MyAssets.prof)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text("name"), Text(x.name ?? "_")],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text("email"), Text(x.email ?? "_")],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [const Text("phone"), Text(x.phone ?? "_")],
                ),
                Row(
                  children: [
                    ElevatedButton(
                      child: const Text("edit"),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const ProfileEditMode()));
                      },
                    ),
                    Consumer(builder: (context, ref, child) {
                      return ElevatedButton(
                        child: const Text("sighnOut"),
                        onPressed: () async {
                          await ref.read(auth.notifier).sighnOut();
                        },
                      );
                    }),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
