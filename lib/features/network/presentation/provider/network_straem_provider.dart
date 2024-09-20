import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:massenger/features/network/domain/entity/network_info.dart';
import 'package:massenger/features/network/domain/repo/net_repo.dart';
import 'package:massenger/injection.dart';

class NetworkStraemProvider extends StateNotifier<Stream<NetWorkInfo>> {
  NetworkStraemProvider() : super(getIt.get<NetRepo>().track());
}
