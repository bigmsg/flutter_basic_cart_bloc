import 'package:flutter/widgets.dart';
import 'package:flutter_basic_cart_bloc/cart.dart';

import 'cart_bloc.dart';

/*
InheritedWidget: 하위 위젯들에게 무언가를 계속 제공할 수 있는 위젯
 */
class CartProvider extends InheritedWidget {

  final CartBloc cartBloc;

  CartProvider({Key key, CartBloc cartBloc, Widget child})
      : cartBloc = cartBloc ?? CartBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
  
  static CartBloc of(BuildContext context) => (context.inheritFromWidgetOfExactType(CartProvider) as CartProvider).cartBloc;

}