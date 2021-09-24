import 'package:esi_2_2021/screens/authentication/signin_page.dart';
import 'package:esi_2_2021/screens/authentication/signup_page.dart';
import 'package:flutter/material.dart';

class AuthenticateScreen extends StatefulWidget {
  @override
  _AuthenticateScreenState createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  bool isShowingSignIn = true;
  // Widget bottomSheetWidget = SignIn();

  // _changeSigning() {
  //   setState(() {
  //     isShowingSignIn = !isShowingSignIn;
  //     if (isShowingSignIn) bottomSheetWidget = SignIn();
  //     if (!isShowingSignIn) bottomSheetWidget = SignUp();
  //   });
  // }

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
          // actions: [
          //   BudyTextButton(
          //     onPressed: () {
          //       setState(() {
          //         isShowingSignIn = !isShowingSignIn;
          //         if (isShowingSignIn) bottomSheetWidget = SignIn();
          //         if (!isShowingSignIn) bottomSheetWidget = SignUp();
          //       });
          //     },
          //     text: isShowingSignIn ? 'Cadastre-se' : 'Entrar',
          //   ),
          // ],
        ),
        body: PageView(
          controller: _pageViewController,
          scrollDirection: Axis.horizontal,
          physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
          // onPageChanged: (index) {
          //   setState(() {
          //     _currentPage = index;
          //   });
          // },
          children: [
            SignIn(tapChangePage: () {
              _pageViewController.jumpToPage(1);
              print('foi 2');
            }),
            SignUp(
              tapChangePage: () {
                _pageViewController.jumpToPage(0);
                print('foi 2');
              },
            ),
          ],
        ),
        // body: SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       // AnimatedSwitcher(
        //       //   switchInCurve: Curves.ease,
        //       //   switchOutCurve: Curves.ease,
        //       //   transitionBuilder: (Widget child, Animation<double> animation) {
        //       //     final offsetAnimation = Tween<Offset>(
        //       //       begin: Offset(0.0, 1.0),
        //       //       end: Offset(0.0, 0.0),
        //       //     ).animate(animation);
        //       //     return SlideTransition(
        //       //       position: offsetAnimation,
        //       //       child: child,
        //       //     );
        //       //   },
        //       //   duration: Duration(milliseconds: 400),
        //       //   child: bottomSheetWidget,
        //       // ),
        //       bottomSheetWidget,
        //       // OrDivider(),
        //       // isShowingSignIn
        //       //     ? HaveAccountButton(
        //       //         text: 'Não possui uma conta?',
        //       //         buttonText: 'Cadastrar',
        //       //         onTap: () => _changeSigning())
        //       //     : HaveAccountButton(
        //       //         text: 'Já possui sua conta?',
        //       //         buttonText: 'Entrar',
        //       //         onTap: () => _changeSigning())
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
