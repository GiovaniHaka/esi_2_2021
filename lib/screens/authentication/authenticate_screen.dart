import 'package:esi_2_2021/screens/authentication/signin_page.dart';
import 'package:esi_2_2021/screens/authentication/signup_page.dart';
import 'package:flutter/material.dart';

class AuthenticateScreen extends StatefulWidget {
  @override
  _AuthenticateScreenState createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  bool isShowingSignIn = true;
  @override
  Widget build(BuildContext context) {
    final _pageViewController = PageController(initialPage: 0);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: PageView(
          controller: _pageViewController,
          scrollDirection: Axis.horizontal,
          physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          children: [
            SignIn(tapChangePage: () {
              _pageViewController.jumpToPage(1);
            }),
            SignUp(
              tapChangePage: () {
                _pageViewController.jumpToPage(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
