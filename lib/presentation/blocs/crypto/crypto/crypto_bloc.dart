import 'package:bloc/bloc.dart';
import 'package:my_crypto/data/data_sources/crypto/remote/remote_crypto_data_source.dart';
import 'package:my_crypto/data/repositories/crypto/crypto_repo.dart';
import 'package:my_crypto/domain/entities/crypto/crypto.dart';
import 'package:my_crypto/domain/use_cases/crypto/remote/remote_crypto_use_case.dart';
import 'package:my_crypto/internal/core/usecases.dart';

import 'crypto_event.dart';
import 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoBloc() : super(const CryptoState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<CryptoState> emit) async {
    IRemoteCryptoDataSource remoteCryptoDataSource = RemoteCryptoDataSource();
    CryptoRemoteRepo repo = CryptoRemoteRepo(remoteDataSource: remoteCryptoDataSource);
    RemoteCryptoUseCase use = RemoteCryptoUseCase(repository: repo);
    List<CryptoEntity> list = [];
    final result = await use.call(NoParams());
    result.fold((l) {
      emit(const DataErrorState());
    }, (r) {
      list = r;
      emit(state.showData(data: list));
    });
  }
}
