import 'package:dartz/dartz.dart';
import 'package:massenger/core/error/failure.dart';
import 'package:massenger/features/chat/data/model/message_model.dart';

abstract class MessageDataSource{
  Stream< List<MessageModel>> watchChat(String chatId); 
  Future<Option<Failure>> sendMSG(MessageModel mm);
}