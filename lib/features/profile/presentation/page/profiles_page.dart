import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:massenger/features/profile/presentation/poviders/profiles_provider.dart';
import 'package:massenger/features/profile/presentation/widget/profile_list.dart';

var profilelist =
    StateNotifierProvider.autoDispose<ProfilesProvider, ProfileListState>(
        (ref) => ProfilesProvider());

class ProfilesPage extends StatelessWidget {
  const ProfilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer(
          builder: (context, ref, child) {
            var p = ref.watch(profilelist);
            if (p.failure != null) {
              return const Center(child: Text("somethising wroing"));
            }
        
            if (p.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
        
            return ProfileList(profiles: p.profiles);
          },
        ),
      ),
    );
  }
}
