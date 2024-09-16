import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:massenger/core/error/failure.dart';
import 'package:massenger/features/chat/data/datasource/message_data_source.dart';
import 'package:massenger/features/chat/data/model/message_model.dart';
import 'package:massenger/injection.dart';
@LazySingleton(as: MessageDataSource,env: [Environment.dev,Environment.prod])
class MessageFirestoreImpl implements MessageDataSource {
  late final FirebaseFirestore store;

  MessageFirestoreImpl() {
   
    store=getIt.get<FirebaseFirestore>();
   
  }
  @override
  Future<Option<Failure>> sendMSG(MessageModel mm) {
    return store
        .collection("chats")
        .add(mm.toMap())
        .then((v) => none(), onError: (_) => some(BadEmailFormate()));
  }

  @override
  Stream<List<MessageModel>> watchChat(String chatId) async* {
    // 01008414327
    yield* store
        .collection("chats")
        
        .snapshots()
        // .listen(
        //   (v) => right<Failure, List<MessageModel>>(
        //       (v.docs.map((xx) => MessageModel.fromMap(xx.data())).toList())),
        //   onError: (e) => left<Failure, List<MessageModel>>(BadEmailFormate()),
        // );
    .map((e) => 
          e.docs.map((xx) => MessageModel.fromMap(xx.data())).toList (),
        );
    //.listen((r)=>right<Failure, List<MessageModel>>( r.docs.map((i)=> MessageModel.fromMap(i)).toList()),onError: (e))
  }
}
