import 'package:flutter/material.dart';
import 'package:my_crypto/internal/locator/locator.dart';
import 'package:my_crypto/internal/navigation/router.gr.dart';
import 'package:my_crypto/presentation/utils/themes/abstract_theme.dart';
import 'package:my_crypto/presentation/utils/themes/bloc/themes_bloc.dart';
import 'package:my_crypto/presentation/widgets/background.dart';
import 'package:my_crypto/presentation/widgets/rounded_text_field.dart';
import 'package:provider/provider.dart';

class MainRegistrationPage extends StatefulWidget {
  const MainRegistrationPage({Key? key}) : super(key: key);

  @override
  _MainRegistrationPageState createState() => _MainRegistrationPageState();
}

class _MainRegistrationPageState extends State<MainRegistrationPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late AbstractTheme _theme;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = Provider.of<ThemesBloc>(context).theme;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(resizeToAvoidBottomInset: true, backgroundColor: _theme.backgroundColor, body: _bodyWidget()));
  }

  _bodyWidget() {
    return Background(
      bottomLeftDecoration: true,
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                      color: _theme.infoTextColor,
                    ),
                  ),
                ),
                const Spacer()
              ],
            ),
            const Spacer(),
            const SizedBox(
              height: 15,
            ),
            RoundedInputField(callback: (String text) {}),
            const SizedBox(height: 15),
            RoundedInputField(callback: (String text) {}),
            const SizedBox(height: 15),
            RoundedInputField(callback: (String text) {}),
            const SizedBox(height: 15),
            RoundedInputField(callback: (String text) {}),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                submitSignIn();
              },
              child: Container(
                height: 45,
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: Colors.deepOrange.withOpacity(.8),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: const Text(
                  "Create New Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void submitSignIn() {
    if (_usernameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      // BlocProvider.of<UserCubit>(context).submitSignUp(user: UserEntity(
      //   email: _emailController.text,
      //   password: _passwordController.text,
      // ));
    }
  }
}
