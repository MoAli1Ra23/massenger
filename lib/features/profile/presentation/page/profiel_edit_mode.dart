import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:massenger/core/utils/my_assets.dart';
import 'package:massenger/features/profile/presentation/page/profile_page.dart';
class ProfileEditMode extends StatelessWidget {
  const ProfileEditMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile( Edit Mode)"),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          var x = ref.watch(profile);

          return Form(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 9 / 5,
                  child: ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                          onTap: () async {
                            await ImagePicker()
                                .pickImage(
                                    maxWidth: 100,
                                    maxHeight: 200,
                                    source: ImageSource.gallery)
                                .then((url) {
                              ref
                                  .watch(profile.notifier)
                                  .imageUrlChange(url!.path);
                            });
                          },
                          child: x.imagepathe != null
                              ? Image.file(File(x
                                  .imagepathe!)) //CachedNetworkImage(imageUrl: x.imagepathe!)
                              : Image.asset(MyAssets.prof))),
                ),
                TextFormField(
                  decoration: const InputDecoration(label: Text("name")),
                  keyboardType: TextInputType.name,
                  onChanged: (v) => ref.read(profile.notifier).nameChange(v),
                  validator: (_) => ref.read(profile).nameErr,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(label: Text("phone")),
                  keyboardType: TextInputType.phone,
                  onChanged: (v) => ref.read(profile.notifier).phoneChange(v),
                  validator: (_) => ref.read(profile).phoneErr,
                ),
                const SizedBox(
                  height: 10,
                ),
                // TextFormField(
                //   onChanged: (v) => ref.read(profile.notifier).nameChange(v),
                //   validator: (x) => ref.read(profile).nameErr,
                // ),
                // const SizedBox(height: 10,)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Consumer(
                      builder: (context, ref, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  ref.read(profile.notifier).confirme();
                                },
                                child: const Text("confirme")),
                            ElevatedButton(
                                onPressed: () {
                                  ref.read(profile.notifier).cancel();
                                },
                                child: const Text("cancel")),
                          ],
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
