import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_crypto/domain/entities/user/user_entity.dart';
import 'package:my_crypto/internal/locator/locator.dart';
import 'package:my_crypto/internal/navigation/router.gr.dart';
import 'package:my_crypto/presentation/blocs/user/user_bloc.dart';
import 'package:my_crypto/presentation/blocs/user/user_event.dart';
import 'package:my_crypto/presentation/blocs/user/user_state.dart';
import 'package:my_crypto/presentation/pages/profile/widgets/unauthorized_profile_body.dart';
import 'package:my_crypto/presentation/utils/themes/abstract_theme.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_bloc.dart';
import 'package:my_crypto/presentation/widgets/snackbar.dart';
import 'package:provider/provider.dart';

import 'widgets/authorized_profile_body.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          CustomSnackBar.showSnackNar(context, 'Registration error', 'Something went wrong...');
        }
      },
      builder: (context, state) {
        return Container(
          color: _theme.backgroundColor,
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Column(
            children: [
              Builder(builder: (context) {
                if (state is AuthorizedState) {
                  final UserEntity user = state.user;
                  return Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        width: 60,
                        height: 60,
                        clipBehavior: Clip.hardEdge,
                        child: CachedNetworkImage(
                          imageUrl: user.imageLink,
                          fit: BoxFit.cover,
                          errorWidget: (context, error, variable) {
                            return Container(
                              color: Colors.red,
                            );
                          },
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          getIt<AppRouter>().push(const SettingsRoute());
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: _theme.cardColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.settings, color: _theme.infoTextColor),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {
                          CustomSnackBar.showSnackNar(
                              context, 'Not so quickly', 'If you want to log out please hold down');
                        },
                        onLongPress: () {
                          _userBloc.add(const LogoutEvent());
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: _theme.cardColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.logout_sharp,
                            color: _theme.infoTextColor,
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          getIt<AppRouter>().pushNamed('settings');
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(color: _theme.cardColor, shape: BoxShape.circle),
                          child: const Icon(Icons.settings),
                        ),
                      ),
                    ],
                  );
                }
              }),
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
        );
      },
    );
  }
}
