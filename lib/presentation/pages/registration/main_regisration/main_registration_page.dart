import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart' as easy_local;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_crypto/internal/locator/locator.dart';
import 'package:my_crypto/internal/navigation/router.gr.dart';
import 'package:my_crypto/presentation/blocs/auth/user_bloc.dart';
import 'package:my_crypto/presentation/blocs/auth/user_event.dart';
import 'package:my_crypto/presentation/blocs/auth/user_state.dart';
import 'package:my_crypto/presentation/utils/themes/abstract_theme.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_bloc.dart';
import 'package:my_crypto/presentation/utils/validators.dart';
import 'package:my_crypto/presentation/widgets/background.dart';
import 'package:my_crypto/presentation/widgets/main_rounded_button.dart';
import 'package:my_crypto/presentation/widgets/rounded_text_field.dart';
import 'package:my_crypto/presentation/widgets/snackbar.dart';
import 'package:provider/provider.dart';

class MainRegistrationPage extends StatefulWidget {
  const MainRegistrationPage({Key? key}) : super(key: key);

  @override
  _MainRegistrationPageState createState() => _MainRegistrationPageState();
}

class _MainRegistrationPageState extends State<MainRegistrationPage> {
  String _nameAndSurname = '';
  String _email = '';
  String _password = '';
  String _password2 = '';

  late AbstractTheme _theme;
  late AuthBloc _userBloc;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = Provider.of<ThemesBloc>(context).theme;
    _userBloc = Provider.of<AuthBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Background(
            bottomLeftDecoration: true,
            callbackForBackButton: () {
              getIt<AppRouter>().navigateBack();
            },
            child: Scaffold(
                resizeToAvoidBottomInset: true, backgroundColor: _theme.backgroundColor, body: _bodyWidget())));
  }

  _bodyWidget() {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Spacer(
            flex: 2,
          ),
          AutoSizeText(
            easy_local.tr('create_new_account'),
            minFontSize: 16,
            maxFontSize: 22,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: _theme.infoTextColor),
          ),
          const Spacer(),
          const SizedBox(
            height: 15,
          ),
          RoundedInputField(
            callback: (String text) {
              _nameAndSurname = text;
            },
            hint: easy_local.tr('name_and_surname'),
          ),
          const SizedBox(height: 15),
          RoundedInputField(
            callback: (String text) {
              _email = text;
            },
            icon: Icons.email,
            hint: easy_local.tr('email'),
          ),
          const SizedBox(height: 15),
          // RoundedInputField(
          //   callback: (String text) {},
          //   icon: Icons.phone,
          //   hint: easy_local.tr('phone_number'),
          // ),
          // const SizedBox(height: 15),
          RoundedInputField(
              callback: (String text) {
                _password = text;
              },
              icon: Icons.password,
              isPassword: true,
              hint: easy_local.tr('password'),
              isPasswordCanBeVisible: false),
          const SizedBox(height: 15),
          RoundedInputField(
              callback: (String text) {
                _password2 = text;
              },
              icon: Icons.password,
              isPassword: true,
              hint: easy_local.tr('repeat_password'),
              isPasswordCanBeVisible: false),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<AuthBloc, UserState>(
            builder: (context, state) {
              return MainRoundedButton(
                  text: easy_local.tr('sign_up'),
                  color: _theme.accentColor,
                  callback: () {
                    _submitSignUp(context);
                  },
                  isLoading: state is InProgressAuthState,
                  theme: _theme,
                  paddingVert: 16);
            },
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }

  void _submitSignUp(BuildContext context) {
    if (_nameAndSurname.length > 3 && _email.isValidEmail) {
      if (_password == _password2) {
        if (_password.length > 5) {
          _userBloc.add(RegisterWithEmailAndPassword(_email, _password, _nameAndSurname));
        } else {
          CustomSnackBar.showSnackNar(context, 'Error', 'Small Password');
        }
      } else {
        CustomSnackBar.showSnackNar(context, 'Error', 'Passwords do not match');
      }
    } else {
      CustomSnackBar.showSnackNar(context, 'Error', 'Input valid data');
    }
  }
}
