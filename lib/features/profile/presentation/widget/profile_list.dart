// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:massenger/core/utils/my_assets.dart';

import 'package:massenger/features/profile/domain/entity/profile.dart';

class ProfileList extends StatelessWidget {
  const ProfileList({
    super.key,
    required this.profiles,
  });
  final List<Profile> profiles;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: profiles.length,
      itemBuilder: (context, index) {
        var cr = profiles[index];
        return Card(
          child: Row(
            children: [
              CircleAvatar(
                child: cr.imagepathe != null
                    ? CachedNetworkImage(imageUrl: cr.imagepathe!)
                    : Image.asset(MyAssets.prof),
              ),
              Text((cr.name ?? cr.email) ?? "_")
            ],
          ),
        );
      },
    );
  }
}
