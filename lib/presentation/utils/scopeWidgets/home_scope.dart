import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class HomePageScope extends StatelessWidget {
  const HomePageScope({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoRouter(
      placeholder: (BuildContext context) {
        return Container(
        );
      },
    );
  }
}
