import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final ordersData = Provider.of<Orders>(context);
    print(ordersData.orders);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      drawer: AppDrawer(),
      body: ordersData.orders.isEmpty
          ? Center(
              child: Text('You Don\'t have any Orders yet!'),
            )
          : ListView.builder(
              itemBuilder: (ctx, i) => OrderItem(
                ordersData.orders[i],
              ),
              itemCount: ordersData.orders.length,
            ),
    );
  }
}
