import 'package:flutter/material.dart';
import 'package:flutter_basic_cart_bloc/bloc/cart_bloc.dart';
import 'package:flutter_basic_cart_bloc/catalog.dart';


/*
  위젯상태 관리방법 3가지
  1. setState() 사용
  2. Bloc 패턴
  3. Provider 패턴

  # UI,로직 분리방법 2가지
  1. Bloc(rxdart 패키지)
  2. Provider (Provider 패키지)

  # Bloc Pattern
  방법1. rxdart(Bloc객체 전역변수 사용) + StreamBuilder <- 가장 심플
  방법2. rxdart + InheritedWidget  <- InheritedWidget 하위위젯만 Bloc 변수 사용가능하게끔 함
  방법3. flutter bloc 패키지 사용     <- 엄청복잡, 강력 비추
 */

void main() => runApp(MyApp());

final cartBloc = CartBloc();

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /*return CartProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );*/
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('버튼'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Catalog()));
          },
        )
      ),

    );
  }
}


