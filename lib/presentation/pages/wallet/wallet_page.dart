import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_crypto/presentation/blocs/user/user_bloc.dart';
import 'package:my_crypto/presentation/blocs/user/user_state.dart';
import 'package:my_crypto/presentation/pages/profile/widgets/authorized_profile_body.dart';
import 'package:my_crypto/presentation/pages/profile/widgets/unauthorized_profile_body.dart';
import 'package:my_crypto/presentation/utils/themes/abstract_theme.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_bloc.dart';
import 'package:provider/provider.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  late AbstractTheme _theme;
  late UserBloc _userBloc;

  @override
  void didChangeDependencies() {
    _theme = Provider.of<ThemesBloc>(context).theme;
    _userBloc = Provider.of<UserBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is AuthorizationErrorState) {
          Flushbar(
            title: "Registration error",
            message: "Something went wrong...",
            duration: const Duration(seconds: 3),
          ).show(context);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Container(
            color: _theme.backgroundColor,
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(child: Builder(builder: (context) {
                  if (state is AuthorizedState) {
                    return AuthorizedProfileBody(
                      userEntity: state.user,
                      theme: _theme,
                    );
                  } else if (state is InProgressAuthState) {
                    return const CircularProgressIndicator();
                  } else {
                    return UnauthorizedProfile(
                      theme: _theme,
                    );
                  }
                })),
              ],
            ),
          ),
        );
      },
    );
  }
}
