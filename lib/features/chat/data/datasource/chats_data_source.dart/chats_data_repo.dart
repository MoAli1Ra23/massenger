import 'package:dartz/dartz.dart';
import 'package:massenger/core/error/failure.dart';
import 'package:massenger/features/chat/data/model/chat_model.dart';

abstract class ChatsDataRepo {
  Future<Either<Failure, List<ChatModel>>> getAllChatPerUser(String userids);
Future<Option<Failure>> createChat(ChatModel chat);
  Future<Option<Failure>>  updateChat(ChatModel chat);
  Stream<Either<Failure,ChatModel>> watchChat(ChatModel chat);
}
