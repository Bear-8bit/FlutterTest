import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/appbar/appbar.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/screen/order/widget/list_item.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Đơn hàng của bạn', style: Theme.of(context).textTheme.headlineMedium), showBackArrow: true),
      body: const Padding(
        padding: EdgeInsets.all(TSize.defaultSpace),

        // Order
        child: TListItem(),
      ),
    );
  }
}