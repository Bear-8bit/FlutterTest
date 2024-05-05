import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/utils/contatiner/rounded_container.dart';
import 'package:flutter_store/app/config/utils/image_container/rounded_image_container.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/data/api.dart';
import 'package:flutter_store/app/model/product.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/common/style/shadow.dart';
import 'product_add.dart';

class ProductBuilder extends StatefulWidget {
  const ProductBuilder({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductBuilder> createState() => _ProductBuilderState();
}

class _ProductBuilderState extends State<ProductBuilder> {

  Future<List<ProductModel>> _getProducts() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
    return await APIRepository().getProduct(prefs.getString('accountID').toString(), prefs.getString('token').toString());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: _getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.separated(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final itemProduct = snapshot.data![index];
              return _buildProduct(itemProduct, context);
            }, separatorBuilder: (context, index) => const SizedBox(height: 13),
          ),
        );
      },
    );
  }

  Widget _buildProduct(ProductModel pro, BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: const [ShadowStyle.horizontalProductShadow],
          borderRadius: BorderRadius.circular(TSize.productImageRadius),
          color: dark ? Colors.black : Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            RoundedContainer(
              height: 80.0,
              width: 80.0,
              showBorder: true,
              child: RoundedImage(
                isNetworkImage: true,
                imageUrl: pro.imageUrl,
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pro.name,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    NumberFormat('#,##0 ' + 'đ').format(pro.price),
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  // const SizedBox(height: 4.0),
                  // Text('Category: ${pro.catId}'),
                ],
              ),
            ),
            IconButton(
                onPressed: () async {
                    SharedPreferences pref = await SharedPreferences.getInstance();
                  setState(() async {
                    await APIRepository().removeProduct(pro.id, pref.getString('accountID').toString() , pref.getString('token').toString());
                  });
                },
                icon: const Icon(
                  Iconsax.trash,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context)
                        .push(
                          MaterialPageRoute(
                            builder: (_) => ProductAdd(
                              isUpdate: true,
                              productModel: pro,
                            ),
                            fullscreenDialog: true,
                          ),
                        )
                        .then((_) => setState(() {}));
                  });
                },
                icon: const Icon(
                  Iconsax.edit,
                  color: Colors.black,
                ))
          ],
        ),
      ),
    );
  }
}
