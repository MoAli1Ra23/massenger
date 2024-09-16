import 'package:dartz/dartz.dart';
import 'package:massenger/core/error/failure.dart';
import 'package:massenger/features/chat/domain/entity/message.dart';

abstract class MessageRepo {
  Stream<Either<Failure, List<Message>>> watchChat(String id);
  Future<Option<Failure>> sendMessge(Message m, String chatId);
}
