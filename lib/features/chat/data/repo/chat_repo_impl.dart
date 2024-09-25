import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:massenger/core/error/failure.dart';
import 'package:massenger/features/chat/data/datasource/chats_data_source.dart/chats_data_repo.dart';
import 'package:massenger/features/chat/data/model/chat_model.dart';
import 'package:massenger/features/chat/domain/entity/chat.dart';
import 'package:massenger/features/chat/domain/repo/chat_repo.dart';

@LazySingleton(as: ChatRepo, env: [Environment.dev, Environment.prod])
class ChatRepoImpl extends ChatRepo {
  final ChatsDataRepo repo;

  ChatRepoImpl(this.repo);
  @override
  Future<Either<Failure, Chat>> createChat(Chat chat) async {
    var x = await repo.createChat(chat as ChatModel);
    return x.fold(() => Right(chat), (f) => left(f));
  }

  @override
  Future<Either<Failure, List<Chat>>> getChatForUser(String userid) async {
    var x = await repo.getAllChatPerUser(userid);
    return x;
  }
}
