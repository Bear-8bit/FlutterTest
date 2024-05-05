import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/appbar/appbar.dart';
import 'package:flutter_store/app/screen/categories/manage/category_add.dart';
import 'package:flutter_store/app/screen/categories/manage/category_data.dart';
import 'package:iconsax/iconsax.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Padding(padding: const EdgeInsets.only(left: 10), child: Text('Danh sách danh mục', style: Theme.of(context).textTheme.headlineMedium,)),
      ),
      body: const Center(child: CategoryBuilder()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (_) => const CategoryAdd(),
                  fullscreenDialog: true,
                ),
              )
              .then((_) => setState(() {}));
        },
        tooltip: 'Thêm mới',
        child: const Icon(Iconsax.add),
      ),
    );
  }
}