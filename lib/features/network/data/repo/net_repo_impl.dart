import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:massenger/features/network/domain/entity/network_info.dart';
import 'package:massenger/features/network/domain/repo/net_repo.dart';

@LazySingleton(as: NetRepo)
class NetRepoImpl extends NetRepo {
  final Connectivity _connectivity;

  NetRepoImpl({required Connectivity connectivity})
      : _connectivity = connectivity;
  @override
  Stream<NetWorkInfo> track() => _connectivity
      .checkConnectivity()
      .asStream()
      .map<NetWorkInfo>((x) => _convertResutlToNetWorkInfo(x));
  @override
  Future<NetWorkInfo> check() => _connectivity
      .checkConnectivity()
      .then<NetWorkInfo>((x) => _convertResutlToNetWorkInfo(x));
  NetWorkInfo _convertResutlToNetWorkInfo(List<ConnectivityResult> x) {
    return NetWorkInfo(
        isWifi: x.contains(ConnectivityResult.wifi),
        isMob: x.contains(ConnectivityResult.ethernet),
        isConnected: _isConnected(x));
  }

  bool _isConnected(List<ConnectivityResult> l) =>
      l.contains(ConnectivityResult.mobile) ||
      l.contains(ConnectivityResult.wifi);
}
