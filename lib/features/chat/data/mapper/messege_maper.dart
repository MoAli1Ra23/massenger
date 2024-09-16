import 'package:massenger/features/chat/data/model/message_model.dart';
import 'package:massenger/features/chat/domain/entity/message.dart';

abstract class MessegeMaper {
 static MessageModel formDomain(Message m) {
    return MessageModel(text: m.text, dateTime: m.dateTime);
  }
}
