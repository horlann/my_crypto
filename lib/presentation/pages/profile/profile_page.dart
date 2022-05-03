import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_crypto/domain/entities/user/user_entity.dart';
import 'package:my_crypto/internal/locator/locator.dart';
import 'package:my_crypto/internal/navigation/router.gr.dart';
import 'package:my_crypto/presentation/blocs/user/user_bloc.dart';
import 'package:my_crypto/presentation/blocs/user/user_event.dart';
import 'package:my_crypto/presentation/blocs/user/user_state.dart';
import 'package:my_crypto/presentation/utils/themes/abstract_theme.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_bloc.dart';
import 'package:provider/provider.dart';

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
          Flushbar(
            title: "Registration error",
            message: "Something went wrong...",
            duration: const Duration(seconds: 3),
          ).show(context);
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
                        width: 80,
                        height: 80,
                        clipBehavior: Clip.hardEdge,
                        child: Image.network(
                          user.imageLink, fit: BoxFit.cover, errorBuilder: (context, object, error) {
                          return const Icon(Icons.hail);
                        }),
                      ),
                      const Spacer(),
                      GestureDetector(
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
                      GestureDetector(
                        onTap: () {
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
                  return GestureDetector(
                    onTap: () {
                      getIt<AppRouter>().pushNamed('settings');
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      color: _theme.cardColor,
                      child: const Icon(Icons.settings),
                    ),
                  );
                }
              }),
              const Spacer(),
              Center(child: Builder(builder: (context) {
                if (state is AuthorizedState) {
                  final UserEntity user = state.user;
                  return Text(
                    '${user.name} Done!',
                    style: TextStyle(fontSize: 20, color: _theme.infoTextColor),
                  );
                } else if (state is InProgressAuthState) {
                  return const CircularProgressIndicator();
                } else {
                  return Column(
                    children: [
                      TextFormField(),
                      TextFormField(),
                      ElevatedButton(
                          onPressed: () {
                            _userBloc.add(const LoginWithEmailAndPasswordEvent('tortos122@gmail.com', '123456'));
                          },
                          child: const Text('login')),
                      ElevatedButton(
                          onPressed: () {
                            _userBloc.add(const RegisterWithEmailAndPassword('tortos', 'qwert'));
                          },
                          child: const Text('register'))
                    ],
                  );
                }
              })),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}
