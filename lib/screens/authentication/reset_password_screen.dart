import 'package:esi_2_2021/services/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final AuthService _auth = AuthService();
  final _formResetPassKey = GlobalKey<FormState>();

  String _email = '';
  String _errorToResetPass = '';
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.all(10),
              child: Form(
                key: _formResetPassKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Redefinir senha!',
                              style: Theme.of(context).textTheme.headline5),
                          Text(
                            'Insira o seu email de cadastro e enviaremos um link para que você volte a acessar sua conta!',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
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
                          return 'Insira sua senha!';
                        return null;
                      },
                    ),
                    _errorToResetPass.isEmpty
                        ? Container()
                        : Text(_errorToResetPass),
                    Divider(),
                    TextButton(
                      child: Text('Enviar para email'),
                      onPressed: () async {
                        if (_formResetPassKey.currentState!.validate()) {
                          setState(
                              () => {_loading = true, _errorToResetPass = ''});
                          await _auth.resetUserPassword(_email).then((value) {
                            setState(() {
                              _loading = false;
                              if (value == false) {
                                _errorToResetPass =
                                    'Ops, algo deu errado, verifique o email informado!';
                              }
                            });
                            Get.snackbar('Email enviado!',
                                'Verifique o link em seu email!',
                                snackPosition: SnackPosition.BOTTOM);
                          });
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
