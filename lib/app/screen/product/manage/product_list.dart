import 'package:flutter/material.dart';
import 'package:flutter_store/app/screen/product/manage/product_add.dart';
import 'package:flutter_store/app/screen/product/manage/product_data.dart';
import 'package:iconsax/iconsax.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text("Danh sách sản phẩm", style: Theme.of(context).textTheme.headlineMedium),
        ),
      ),
      body: const Center(child: ProductBuilder()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (_) => const ProductAdd(),
                  fullscreenDialog: true,
                ),
              )
              .then((_) => setState(() {}));
        },
        tooltip: 'Add New',
        child: const Icon(Iconsax.add),
      ),
    );
  }
}
