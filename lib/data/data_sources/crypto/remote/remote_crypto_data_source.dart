import 'package:dio/dio.dart';
import 'package:my_crypto/data/api/models/remote_models/coin_gecko/crypto_remote_model_from_coinGecko.dart';
import 'package:my_crypto/data/api/models/remote_models/coin_market_cap/crypto_remote_model.dart';
import 'package:my_crypto/data/api/utils/api_config.dart';
import 'package:my_crypto/domain/entities/crypto/crypto.dart';
import 'package:my_crypto/internal/core/exceptions.dart';

abstract class IRemoteCryptoDataSource {
  Future<List<CryptoEntity>> getAllCryptos();

  Future<List<CryptoEntity>> getCryptosFromCoinMarketCap();

  Future<List<CryptoEntity>> getMetadata({required List<CryptoEntity> listWithCrypto});
}

class RemoteCryptoDataSource extends IRemoteCryptoDataSource {
  @override
  Future<List<CryptoEntity>> getAllCryptos() async {
    return getCryptosFromCoinMarketCap();
  }

  @override
  Future<List<CryptoEntity>> getCryptosFromCoinMarketCap() async {
    var dio = Dio();
    final response = await dio.get(
      '${restApiCoinMarketCap}v1/cryptocurrency/listings/latest',
      queryParameters: {
        'limit': 20,
      },
      options: Options(
        headers: {
          coinMarketCapApiKeyHeader: coinMarketCapApiKey,
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
    for (var element in listWithCrypto) {
      ids.add(element.id);
    }

    listWithCrypto = await getMetadata(listWithCrypto: listWithCrypto);
    if (response.statusCode == 200) {
      return getDataFromCoinGecko(listWithCrypto: listWithCrypto);
    } else {
      throw ServerException;
    }
  }

  Future<List<CryptoEntity>> getMetadata({required List<CryptoEntity> listWithCrypto}) async {
    List<CryptoEntity> updatedList = [];
    List<String> ids = [];
    for (var element in listWithCrypto) {
      ids.add(element.id);
    }
    var dio = Dio();
    final response = await dio.get(
      '${restApiCoinMarketCap}v2/cryptocurrency/info',
      queryParameters: {'id': ids.join(',')},
      options: Options(
        headers: {
          coinMarketCapApiKeyHeader: coinMarketCapApiKey,
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

  Future<List<CryptoEntity>> getDataFromCoinGecko({required List<CryptoEntity> listWithCrypto}) async {
    List<CryptoEntity> updatedList = [];
    var dio = Dio();
    final response = await dio.get('${restApiCoinGecko}v3/coins/markets?vs_currency=usd&limit=20');
    List<CryptoRemoteModelFromCoinGecko> list = (response.data as List<dynamic>).map((e) {
      return CryptoRemoteModelFromCoinGecko.fromJson(e);
    }).toList();

    list.forEach((coingecko) async {
      listWithCrypto.forEach((element) {
        if (element.name == coingecko.name) {
          updatedList.add(element.copyWith(id: coingecko.id));
        }
      });
    });

    updatedList.sort((a, b) => b.marketCap.compareTo(a.marketCap));
    return getHistoricalData(listWithCrypto: updatedList);
  }

  Future<List<CryptoEntity>> getHistoricalData({required List<CryptoEntity> listWithCrypto}) async {
    List<CryptoEntity> updatedList = [];
    var dio = Dio();
    for (CryptoEntity cryptoEntity in listWithCrypto) {
      final response = await dio.get(
        '${restApiCoinGecko}v3/coins/${cryptoEntity.id}/market_chart?vs_currency=usd&days=7',
        queryParameters: {'interval': 'hourly'},
      );
      final data1 = (response.data['prices'] as List<dynamic>?)
          ?.map((e) => (e as List<dynamic>).map((e) => e as num).toList())
          .toList();
      updatedList.add(cryptoEntity.copyWith(historicalPrices: data1));
    }

    updatedList.sort((a, b) => b.marketCap.compareTo(a.marketCap));
    return updatedList;
  }
}
