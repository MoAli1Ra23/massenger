import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:massenger/core/error/failure.dart';
 import 'package:massenger/features/chat/data/datasource/chats_data_source.dart/chats_data_repo.dart';
import 'package:massenger/features/chat/data/model/chat_model.dart';

@LazySingleton(as: ChatsDataRepo, env: [Environment.dev, Environment.prod])
class ChatsDataRepoImpl extends ChatsDataRepo {
  final FirebaseFirestore store;
   ChatsDataRepoImpl(this.store);
  @override
  Future<Option<Failure>> createChat(ChatModel chat) async {
    try {
      await getChatCollection().doc(chat.id).set(chat.toMap());
      return none();
    } on PlatformException catch (e) {
      // These error codes and messages aren't in the documentation AFAIK, experiment in the debugger to find out about them.
      if (e.message!.contains('PERMISSION_DENIED')) {
        return Some(AuthFailure());
      } else {
        return Some(UnexpectedFailuer());
      }
    }
  }

  @override
  Future<Either<Failure, List<ChatModel>>> getAllChatPerUser(
      String userids) async {
    try {
      return right(await getChatCollection()
          .where('userids', arrayContains: userids)
          .get()
          .then((x) => x.docs.map((xx) {
                return _converMapToChatModel(xx);
              }).toList()));
    } on PlatformException catch (e) {
      if (e.message != null && e.message!.contains('PERMISSION_DENIED')) {
        return Left(AuthFailure());
      } else if (e.message != null && e.message!.contains('NOT_FOUND')) {
        return Left(UnableToUpdateFailure());
      } else {
        return Left(UnexpectedFailuer());
      }
    } catch (_) {
      return Left(UnexpectedFailuer());
    }
  }

  ChatModel _converMapToChatModel(
      QueryDocumentSnapshot<Map<String, dynamic>> xx) {
    var chat = ChatModel.fromMap(xx.data());
    return chat.copyWith(id: xx.id);
  }

  CollectionReference<Map<String, dynamic>> getChatCollection() =>
      store.collection("chats");

  @override
  Future<Option<Failure>> updateChat(ChatModel chat) async {
    // chat.userids
    try {
      await getChatCollection().doc(chat.id).set(chat.toMap());

      return none();
    } on PlatformException catch (e) {
      if (e.message != null && e.message!.contains('PERMISSION_DENIED')) {
        return Some(AuthFailure());
      } else if (e.message != null && e.message!.contains('NOT_FOUND')) {
        return Some(UnableToUpdateFailure());
      } else {
        return Some(UnexpectedFailuer());
      }
    } catch (_) {
      return Some(UnexpectedFailuer());
    }
  }
//TODO: improve catche error in [watchChat] method
  @override
  Stream<Either<Failure, ChatModel>> watchChat(ChatModel chat) async* {
    yield* getChatCollection()
        .doc(chat.id!)
        .get()
        .asStream()
        .map((x) => right<Failure, ChatModel>(ChatModel.fromMap(x.data()!)))
        .handleError((e, s) {
      return Left(AuthFailure());
    });
  }
}
