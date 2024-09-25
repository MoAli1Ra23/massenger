import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:massenger/core/error/failure.dart';
import 'package:massenger/features/chat/domain/entity/message.dart';
import 'package:massenger/features/chat/presentation/provider/messages_provider.dart';

var xx = StateNotifierProvider.autoDispose<MessagesProvider,
    Stream<Either<Failure, List<Message>>>>((ref) => MessagesProvider(""));

class MessagesPage extends ConsumerWidget {
  const MessagesPage({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var x = ref.watch(xx);
    return Scaffold(
      appBar: AppBar(title:const Text("chat")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: x,

                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Either<Failure, List<Message>> eith = snapshot.data!;

                    return eith.fold(
                        (f) => const Center(child: Text("Something  Wrong")),
                        (m) => ListView.builder(
                              itemCount: m.length,
                              itemBuilder: (context, index) =>
                                  Text(m[index].text),
                            ));
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("Something  Wrong"));

                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                // color: Theme.of(context).colorScheme.tertiary

              ),
              child: Row(
                children: [
                    Expanded(
                       child: TextField(
                        decoration: InputDecoration(border: const OutlineInputBorder(), 
                        filled: false,
                        fillColor: Theme.of(context).colorScheme.onInverseSurface
                        
                        ),

                        maxLines: 4,
                        minLines: 1,
                      )),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.send_outlined))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
