import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:massenger/core/error/failure.dart';
import 'package:massenger/features/chat/domain/entity/message.dart';
import 'package:massenger/features/chat/domain/repo/message_repo.dart';
import 'package:massenger/injection.dart';

//  var x= AsyncValue<Either<Failure, List<Message>>>.data((ref)=>getIt.get<MessageRepo>().watchChat("gggg"));
class ChatProvider
    extends StateNotifier<Stream<Either<Failure, List<Message>>>> {
  ChatProvider(String m) : super(getIt.get<MessageRepo>().watchChat(m));
}
