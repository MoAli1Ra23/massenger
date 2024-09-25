// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:massenger/core/error/failure.dart';
import 'package:massenger/features/profile/domain/entity/profile.dart';
import 'package:massenger/features/profile/domain/repo/profile_repo.dart';
import 'package:massenger/injection.dart';

class ProfilesProvider extends StateNotifier<ProfileListState> {
  ProfilesProvider()
      : super(const ProfileListState(
            isLoading: true, profiles: [], failure: null));

  Future<void> load() async {
    ProfileRepo pr = getIt.get<ProfileRepo>();
    state = state.copyWith(isLoading: true);
    var p = await pr.readProfileList();
    p.fold(
      (f) => state = state.copyWith(failure: f, isLoading: false, profiles: []),
      (l) =>
          state = state.copyWith(profiles: l, isLoading: false, failure: null),
    );
  }
}

class ProfileListState extends Equatable {
  final List<Profile> profiles;
  final bool isLoading;
  final Failure? failure;
  const ProfileListState({
    required this.profiles,
    required this.isLoading,
    this.failure,
  });

  ProfileListState copyWith({
    List<Profile>? profiles,
    bool? isLoading,
    Failure? failure,
  }) {
    return ProfileListState(
      profiles: profiles ?? this.profiles,
      isLoading: isLoading ?? this.isLoading,
      failure: failure ?? this.failure,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [profiles, isLoading, failure];
}
