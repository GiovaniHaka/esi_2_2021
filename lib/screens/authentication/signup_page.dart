import 'package:esi_2_2021/services/auth/auth.dart';
import 'package:esi_2_2021/widgets/auth_text_input.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final Function()? tapChangePage;

  const SignUp({Key? key, required this.tapChangePage}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                      'Cadastrar',
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    initialValue: _email,
                    onChanged: (val) {
                      setState(() => _email = val);
                    },
                    validator: (val) {
                      if (val == null || val.isEmpty)
                        return 'Insira um endereço de email válido!';
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
                    child: Text('Cadastrar'),
                    onPressed: () async {
                      print(_email);
                      print(_password);
                      if (_formSignInKey.currentState!.validate()) {
                        setState(() => _loading = true);
                        dynamic result =
                            await _auth.registerWithEmailAndPassword(
                          email: _email!,
                          password: _password!,
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
                    child: Text('Possui conta? Entre'),
                    onPressed: this.widget.tapChangePage,
                  )
                ],
              ),
            ),
          );
  }
}
