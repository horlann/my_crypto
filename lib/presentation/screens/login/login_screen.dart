import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart' as easy_local;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_crypto/internal/locator/locator.dart';
import 'package:my_crypto/internal/navigation/router.gr.dart';
import 'package:my_crypto/presentation/blocs/user/user_bloc.dart';
import 'package:my_crypto/presentation/blocs/user/user_event.dart';
import 'package:my_crypto/presentation/blocs/user/user_state.dart';
import 'package:my_crypto/presentation/utils/themes/abstract_theme.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_bloc.dart';
import 'package:my_crypto/presentation/utils/validators.dart';
import 'package:my_crypto/presentation/widgets/background.dart';
import 'package:my_crypto/presentation/widgets/main_rounded_button.dart';
import 'package:my_crypto/presentation/widgets/rounded_text_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';

  String password = '';

  @override
  Widget build(BuildContext context) {
    AbstractTheme theme = Provider.of<ThemesBloc>(context).theme;
    UserBloc userBloc = Provider.of<UserBloc>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Background(
        bottomRightDecoration: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Container(
            height: size.height,
            padding: const EdgeInsets.fromLTRB(30.0, 30, 30, 0),
            child: BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {
                if (state is AuthorizedState) {
                  getIt<AppRouter>().replaceNamed('mainRoute');
                } else if (state is AuthorizationErrorState) {
                  if (state.error == LoginErrors.incorrectLoginOrPassword) {
                    Flushbar(
                      title: "Error",
                      message: "Incorrect  password or email!",
                      duration: const Duration(seconds: 3),
                    ).show(context);
                  } else if (state.error == LoginErrors.tooMuchRequests) {
                    Flushbar(
                      title: "Error",
                      message: "Too much requests,try again later",
                      duration: const Duration(seconds: 3),
                    ).show(context);
                  } else {
                    Flushbar(
                      title: "Error",
                      message: "Something went wrong...",
                      duration: const Duration(seconds: 3),
                    ).show(context);
                  }
                }
              },
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            getIt<AppRouter>().replaceNamed('login');
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.arrow_back_ios,
                              // color: _theme.infoTextColor,
                            ),
                          ),
                        ),
                        const Spacer()
                      ],
                    ),
                    SvgPicture.asset(
                      "assets/svgIcons/sign_up.svg",
                      height: size.height * 0.3,
                    ),
                    const SizedBox(height: 45),
                    RoundedInputField(
                        hint: easy_local.tr('login'),
                        callback: (text) {
                          email = text;
                        },
                        icon: Icons.person),
                    const SizedBox(height: 15),
                    RoundedInputField(
                        hint: easy_local.tr('password'),
                        callback: (String text) {
                          password = text;
                        },
                        isPassword: true,
                        icon: Icons.lock,
                        suffixIcon: Icons.visibility),
                    const SizedBox(height: 15),
                    MainRoundedButton(
                      text: easy_local.tr('login').toUpperCase(),
                      callback: () {
                        if (state != const InProgressAuthState()) {
                          if (password.length > 5 && email.isValidEmail) {
                            userBloc.add(LoginWithEmailAndPasswordEvent(email, password));
                          } else {
                            Flushbar(
                              title: "Error",
                              message: "Enter valid password or email!",
                              duration: const Duration(seconds: 3),
                            ).show(context);
                          }
                        }
                      },
                      isLoading: state == const InProgressAuthState(),
                      theme: theme,
                      color: theme.accentColor,
                      paddingVert: 18,
                      round: 29,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          easy_local.tr('dont_have_account'),
                          style: TextStyle(color: theme.infoTextColor),
                        ),
                        const Text(' '),
                        GestureDetector(
                          onTap: () {
                            getIt<AppRouter>().pushNamed('registration');
                          },
                          child: Text(
                            easy_local.tr('sign_up'),
                            style: TextStyle(fontWeight: FontWeight.bold, color: theme.infoTextColor),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 75),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
