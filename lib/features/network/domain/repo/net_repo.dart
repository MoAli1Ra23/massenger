import 'package:massenger/features/network/domain/entity/network_info.dart';

abstract class NetRepo{
  Stream<NetWorkInfo> track();
  Future<NetWorkInfo> check();
}