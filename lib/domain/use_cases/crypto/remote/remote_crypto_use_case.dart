import 'package:dartz/dartz.dart';
import 'package:my_crypto/domain/entities/crypto/crypto.dart';
import 'package:my_crypto/domain/repositories/crypto/remote/i_crypto_remote_repo.dart';
import 'package:my_crypto/internal/core/failures.dart';
import 'package:my_crypto/internal/core/usecases.dart';

class RemoteCryptoUseCase extends UseCase<List<CryptoEntity>, NoParams> {
  RemoteCryptoUseCase({required ICryptoRepo repository}) : _repository = repository;

  final ICryptoRepo _repository;

  @override
  Future<Either<Failure, List<CryptoEntity>>> call(params) async {
    return await _repository.getAllCryptos();
  }
}
