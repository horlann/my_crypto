import 'package:flutter/material.dart';
import 'package:my_crypto/domain/entities/user/user_entity.dart';
import 'package:my_crypto/presentation/utils/themes/abstract_theme.dart';

class AuthorizedProfileBody extends StatelessWidget {
  const AuthorizedProfileBody({Key? key, required this.userEntity, required this.theme}) : super(key: key);
  final UserEntity userEntity;
  final AbstractTheme theme;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${userEntity.name} Done!',
      style: TextStyle(fontSize: 20, color: theme.infoTextColor),
    );
  }
}
