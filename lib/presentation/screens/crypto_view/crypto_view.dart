import 'package:flutter/material.dart';
import 'package:my_crypto/domain/entities/crypto/crypto.dart';

class CryptoViewPage extends StatelessWidget {
  const CryptoViewPage({Key? key,required this.cryptoEntity}) : super(key: key);
final CryptoEntity cryptoEntity;
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.deepOrange,);
  }
}
