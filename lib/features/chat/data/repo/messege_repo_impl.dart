import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:massenger/core/error/failure.dart';
import 'package:massenger/features/chat/data/datasource/message_data_source.dart';
import 'package:massenger/features/chat/data/mapper/messege_maper.dart';
import 'package:massenger/features/chat/domain/entity/message.dart';
import 'package:massenger/features/chat/domain/repo/message_repo.dart';

@LazySingleton(as: MessageRepo, env: [Environment.dev, Environment.prod])
class MessegeRepoImpl extends MessageRepo {
  final MessageDataSource source;
  MessegeRepoImpl(this.source);

  @override
  Future<Option<Failure>> sendMessge(Message m, String chatId) {
   return source.sendMSG(MessegeMaper.formDomain(m));
  }

  @override
  Stream<Either<Failure, List<Message>>> watchChat(String id) async* {
   var x= source.watchChat(id);
    try {
      yield* x.asyncMap((c) => right(c))
        ..handleError((e) => left(
             TooShortPassWord())); //.asyncMap((r)=>right(r)).handleError((k)=Left(k));
      //  .handleError((e)=>left(BadEmailFormate()));
    } catch (e) {
      
      yield left(BadEmailFormate());
    }
  }
}
