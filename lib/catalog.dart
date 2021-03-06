import 'package:flutter/material.dart';
import 'bloc/cart_bloc.dart';
import 'cart.dart';
import 'item.dart';
import 'main.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.archive),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Cart()));
            },
          )
        ],
      ),
      body: StreamBuilder<Object>(
        stream: cartBloc.cartList,
        builder: (context, snapshot) {
          return ListView(
            children: cartBloc.itemList
                .map((item) => _buildItem(item, snapshot.data))
                .toList(),
          );
        }
      ),
    );
  }

  Widget _buildItem(Item item, List<Item> state) {
    final isChecked = state.contains(item);

    return Padding(
      child: ListTile(
        title: Text(
            item.title,
          style: TextStyle(fontSize: 31.0)
        ),
        subtitle: Text('${item.price}'),
        trailing: IconButton(
          icon: isChecked
            ? Icon(Icons.check, color: Colors.red)
            : Icon(Icons.check),
          onPressed: () {
              if(isChecked) {
                cartBloc.add(CartEvent(CartEventType.remove, item));
              } else {
                cartBloc.add(CartEvent(CartEventType.add, item));

              }
          },
        ),
      ),
      padding: const EdgeInsets.all(8.0),
    );
  }

}
