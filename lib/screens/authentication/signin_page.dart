import 'package:esi_2_2021/screens/authentication/reset_password_screen.dart';
import 'package:esi_2_2021/services/auth/auth.dart';
import 'package:esi_2_2021/widgets/auth_text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIn extends StatefulWidget {
  final Function()? tapChangePage;

  const SignIn({Key? key, required this.tapChangePage}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formSignInKey = GlobalKey<FormState>();
  bool _loading = false;

  String? _email = '';
  String? _password = '';
  String? _errorToLogin = '';

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formSignInKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 15,
                    ),
                    child: Text(
                      'Entrar',
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    onChanged: (val) {
                      setState(() => _email = val);
                    },
                    validator: (val) {
                      if (val == null || val.isEmpty)
                        return 'Insira seu endereço de email!';
                      return null;
                    },
                  ),
                  Divider(),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Senha',
                    ),
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => _password = val);
                    },
                    validator: (val) {
                      if (val == null || val.isEmpty)
                        return 'Insira sua senha!';
                      return null;
                    },
                  ),
                  _errorToLogin!.isEmpty
                      ? Divider()
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _errorToLogin!,
                            // textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                  Divider(),
                  TextButton(
                    child: Text('Entrar'),
                    onPressed: () async {
                      if (_formSignInKey.currentState!.validate()) {
                        setState(() => _loading = true);
                        dynamic result = await _auth.signInWithEmailAndPassword(
                          _email!,
                          _password!,
                        );
                        if (result['user'] == null) {
                          if (result['authException'] != null) {
                            setState(() {
                              _loading = false;
                              _errorToLogin = result['authException'];
                            });
                          }
                          if (result['authException'] == null) {
                            setState(() {
                              _loading = false;
                              _errorToLogin =
                                  'Ops, algo deu errado, verifique seu email e senha!';
                            });
                          }
                        }
                      }
                    },
                  ),
                  TextButton(
                    child: Text('Não possui uma conta? Cadastre-se'),
                    onPressed: this.widget.tapChangePage,
                  ),
                  TextButton(
                    child: Text('Esqueci minha senha'),
                    onPressed: () => Get.to(ResetPasswordScreen()),
                  ),
                ],
              ),
            ),
          );
  }
}
