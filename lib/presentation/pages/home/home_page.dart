import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as easy_local;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child:  Center(child: Text(easy_local.tr('home'))),
    );
  }
}
