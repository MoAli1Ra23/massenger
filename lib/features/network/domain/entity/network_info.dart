 

import 'package:equatable/equatable.dart';

class NetWorkInfo extends Equatable {
  final bool isMob;
  final bool isWifi;
  final bool isConnected;

  const NetWorkInfo({
    required this.isMob,
    required this.isWifi,
    required this.isConnected,
  });

  NetWorkInfo copyWith({
    bool? isMob,
    bool? isWifi,
    bool? isConnected,
  }) {
    return NetWorkInfo(
      isMob: isMob ?? this.isMob,
      isWifi: isWifi ?? this.isWifi,
      isConnected: isConnected ?? this.isConnected,
    );
  }

   

   
  @override
  List<Object> get props => [isMob, isWifi, isConnected];
}
