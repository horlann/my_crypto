import 'package:dartz/dartz.dart';
import 'package:my_crypto/domain/entities/crypto/crypto.dart';
import 'package:my_crypto/internal/core/failures.dart';

abstract class ICryptoRepo{
  Future<Either<Failure, List<CryptoEntity>>> getAllCryptos();

}