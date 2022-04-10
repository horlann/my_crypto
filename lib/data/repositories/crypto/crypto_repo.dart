import 'package:dartz/dartz.dart';
import 'package:my_crypto/data/data_sources/crypto/remote/remote_crypto_data_source.dart';
import 'package:my_crypto/domain/entities/crypto/crypto.dart';
import 'package:my_crypto/domain/repositories/crypto/remote/i_crypto_remote_repo.dart';
import 'package:my_crypto/internal/connection_checker.dart';
import 'package:my_crypto/internal/core/failures.dart';
import 'package:my_crypto/internal/locator/locator.dart';

class CryptoRemoteRepo extends ICryptoRepo {
  final IRemoteCryptoDataSource remoteDataSource;

  CryptoRemoteRepo({required this.remoteDataSource});

  // final PersonLocalDataSource localDataSource;
  @override
  Future<Either<Failure, List<CryptoEntity>>> getAllCryptos() async {
    if (getIt.get<ConnectionChecker>().isConnected) {
      try {
        List<CryptoEntity> cryptoList = await remoteDataSource.getAllCryptos();
        return Right(cryptoList);
      } on ServerFailure {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
