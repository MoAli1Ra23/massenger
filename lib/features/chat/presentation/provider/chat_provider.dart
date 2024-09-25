import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:massenger/core/error/failure.dart';
import 'package:massenger/features/authentication/domain/entity/user.dart';
import 'package:massenger/features/authentication/domain/repo/auth.dart';
import 'package:massenger/features/chat/domain/entity/chat.dart';
import 'package:massenger/features/chat/domain/repo/chat_repo.dart';
import 'package:massenger/injection.dart';

class ChatProvider extends StateNotifier<ChatsState> {
  ChatProvider()
      : super(const ChatsState(isConnected: true, chats: [], failure: null)
            // Chat(id: "0", profiles: [
            //   Profile(userId: "-", name: "Ali"),
            //   Profile(userId: "-", name: "Ahamad"),
            //   Profile(userId: "-", name: "Ahamad"),
            //   Profile(userId: "-", name: "Ahamad"),
            //   Profile(userId: "-", name: "Ahamad",),
            // ], messages: [],lastMessge: "alismlsmwn;lwdmokwjerjnp;wko"),
            // Chat(id: "0", profiles: [
            //   Profile(userId: "-", name: "Ali"),
            //   Profile(userId: "-", name: "Ahamad"),
            //   Profile(userId: "-", name: "Ahamad"),
            //   Profile(userId: "-", name: "Ahamad"),
            //   Profile(userId: "-", name: "Ahamad",),
            // ], messages: [],lastMessge: "alismlsmwn;lwdmokwjerjnp;wko"),
            // Chat(id: "0", profiles: [
            //   Profile(userId: "-", name: "Ali"),
            //   Profile(userId: "-", name: "Ahamad"),
            //   Profile(userId: "-", name: "Ahamad"),
            //   Profile(userId: "-", name: "Ahamad"),
            //   Profile(userId: "-", name: "Ahamad",),
            // ], messages: [], ),
            // Chat(id: "0", profiles: [
            //   Profile(userId: "-", name: "Ali"),
            //   Profile(userId: "-", name: "Ahamad"),
            //   Profile(userId: "-", name: "Ahamad"),
            //   Profile(userId: "-", name: "Ahamad"),
            //   Profile(userId: "-", name: "Ahamad",),
            // ], messages: [],lastMessge: "hamadahamadahamadahamadahamadahamadahamadahamadahamadahamadahamadahamadahamadahamadahamada")
            );
  Future<void> load() async {
    User user = await _getuser();
    if (user.id == null) {
      state = state.copyWith(failure: AuthFailure());
      return;
    }
    var x = await getIt.get<ChatRepo>().getChatForUser(user.id!);

    x.fold(
      (l) => state = state.copyWith(failure: l),
      (c) => state = state.copyWith(chats: c),
    );
  }

  Future<User> _getuser() async {
    var user = (await getIt.get<Auth>().getCurrentUser())
        .getOrElse(() => const User());
    return user;
  }
}

class ChatsState extends Equatable {
  final bool isConnected;
  final List<Chat> chats;
  final Failure? failure;
  const ChatsState({
    required this.isConnected,
    required this.chats,
    required this.failure,
  });

  ChatsState copyWith({
    bool? isConnected,
    List<Chat>? chats,
    Failure? failure,
  }) {
    return ChatsState(
      isConnected: isConnected ?? this.isConnected,
      chats: chats ?? this.chats,
      failure: failure ?? this.failure,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [isConnected, chats, failure];
}
