import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:massenger/core/error/failure.dart';
import 'package:massenger/features/chat/domain/entity/message.dart';
import 'package:massenger/features/chat/presentation/provider/chat_provider.dart';

var xx =
    StateNotifierProvider<ChatProvider, Stream<Either<Failure, List<Message>>>>(
        (ref) => ChatProvider(""));

class ChatsPage extends ConsumerWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var x = ref.watch(xx);
    return Scaffold(
      body: StreamBuilder(
        stream: x,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Either<Failure, List<Message>> eith = snapshot.data!;

            if (eith.isRight()) {
              List<Message> m = eith.fold((_) => [], (c) => c);
              return ListView.builder(
                itemCount: m.length,
                itemBuilder: (context, index) => Text(m[index].text),
              );
            }
          }
          return const Center(child: Text("Something  Wrong"));
        },
      ),
    );
  }
}
