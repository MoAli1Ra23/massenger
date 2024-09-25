import 'package:dartz/dartz.dart';
import 'package:massenger/core/error/failure.dart';
import 'package:massenger/features/chat/domain/entity/chat.dart';

abstract class ChatRepo {
  Future<Either<Failure,List<Chat>>> getChatForUser(String userid);
  Future<Either<Failure, Chat>> createChat(Chat chat);

  
}