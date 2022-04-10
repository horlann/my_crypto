import 'package:dio/dio.dart';
import 'package:my_crypto/data/api/models/remote_models/crypto_remote_model.dart';
import 'package:my_crypto/domain/entities/crypto/crypto.dart';
import 'package:my_crypto/internal/core/exceptions.dart';

abstract class IRemoteCryptoDataSource {
  Future<List<CryptoEntity>> getAllCryptos();
}

class RemoteCryptoDataSource extends IRemoteCryptoDataSource {
  @override
  Future<List<CryptoEntity>> getAllCryptos() async {
    return getLatestTrending();
    // var dio = Dio();
    // final response = await dio.get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd');
    // List<CryptoRemoteModel> list = (response.data as List<dynamic>).map((e) {
    //   return CryptoRemoteModel.fromJson(e);
    // }).toList();
    //
    // List<CryptoEntity> listWithCrypto = list.map((e) {
    //   return CryptoEntity.fromRemoteModel(remoteModel: e);
    // }).toList();
    // if (response.statusCode == 200) {
    //   return listWithCrypto;
    // } else {
    //   throw ServerException;
    // }
  }

  Future<List<CryptoEntity>> getLatestTrending() async {
    var dio = Dio();
    final response = await dio.get(
      'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest',
      queryParameters: {
        'limit': 20,
      },
      options: Options(
        headers: {
          "X-CMC_PRO_API_KEY": "42ce6a32-2cff-44f2-ac3c-2ceb3b77acf1",
        },
      ),
    );
    List<CryptoRemoteModel> list = (response.data['data'] as List<dynamic>).map((e) {
      return CryptoRemoteModel.fromJson(e);
    }).toList();
    List<CryptoEntity> listWithCrypto = list.map((e) {
      return CryptoEntity.fromRemoteModel(remoteModel: e);
    }).toList();
    List<String> ids = [];
    listWithCrypto.forEach((element) {
      ids.add(element.id);
    });

    listWithCrypto = await getMetadata(listWithCrypto: listWithCrypto);
    if (response.statusCode == 200) {
      return listWithCrypto;
    } else {
      throw ServerException;
    }
  }

  Future<List<CryptoEntity>> getMetadata({required List<CryptoEntity> listWithCrypto}) async {
    List<CryptoEntity> updatedList = [];
    List<String> ids = [];
    listWithCrypto.forEach((element) {
      ids.add(element.id);
    });
    var dio = Dio();
    final response = await dio.get(
      'https://pro-api.coinmarketcap.com/v2/cryptocurrency/info',
      queryParameters: {'id': ids.join(',')},
      options: Options(
        headers: {
          "X-CMC_PRO_API_KEY": "42ce6a32-2cff-44f2-ac3c-2ceb3b77acf1",
        },
      ),
    );

    (response.data['data'] as Map<String, dynamic>).forEach((key, value) {
      listWithCrypto.forEach((element) {
        if (element.id == key) {
          updatedList.add(element.copyWith(imageLink: value['logo']));
        }
      });
    });
    updatedList.sort((a, b) => b.marketCap.compareTo(a.marketCap));
    return updatedList;
  }
}
