import 'package:equatable/equatable.dart';
import 'package:my_crypto/domain/entities/crypto/crypto.dart';

class CryptoState extends Equatable {
  const CryptoState();

  CryptoState init() {
    return const CryptoState();
  }

  CryptoState clone() {
    return const CryptoState();
  }

  CryptoState showData({required List<CryptoEntity> data}) {
    return ShowDataState(data: data);
  }

  @override
  List<Object?> get props => [];
}

class ShowDataState extends CryptoState {
  const ShowDataState({required this.data});

  final List<CryptoEntity> data;

  @override
  List<Object?> get props => [data];
}
class DataErrorState extends CryptoState {
  const DataErrorState();


}