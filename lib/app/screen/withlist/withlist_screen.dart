import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/common/style/shadow.dart';
import 'package:flutter_store/app/config/utils/appbar/appbar.dart';
import 'package:flutter_store/app/config/utils/contatiner/rounded_container.dart';
import 'package:flutter_store/app/config/utils/icon/square_icons.dart';
import 'package:flutter_store/app/config/utils/image_container/rounded_image_container.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/config/utils/widget_text/product_title_text.dart';
import 'package:flutter_store/app/data/sqlite.dart';
import 'package:flutter_store/app/model/withlist.dart';
import 'package:flutter_store/app/screen/cart/cart.dart';
import 'package:flutter_store/app/screen/product/widget/cart_icon.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class WithlistScreen extends StatefulWidget {
  const WithlistScreen({super.key, this.data});

  final int? data;

  @override
  State<WithlistScreen> createState() => _WithlistState();
}

class _WithlistState extends State<WithlistScreen> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<List<Withlist>> _getProducts() async {
    return await _databaseHelper.withlistproducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Danh sách yêu thích', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CartIcon(onPressed: () => Get.to(() => const CartScreen()), iconColor: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: FutureBuilder<List<Withlist>>(
            future: _getProducts(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 278,
                      mainAxisSpacing: TSize.gridViewSpacing,
                      crossAxisSpacing: TSize.gridViewSpacing,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final itemProduct = snapshot.data![index];
                      return _buildProduct(itemProduct, context);
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
  Widget _buildProduct(Withlist pro, BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: (){},
      child: Container(
          width: 280,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
          boxShadow: const [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSize.productImageRadius),
          color: dark ? Colors.black : Colors.white,
        ),

        child: Column(
          children: [
            RoundedContainer(
              height: 170,
              padding: const EdgeInsets.all(TSize.sm),
              backgroundColor: dark ? Colors.black : Colors.white,
              child: Stack(
                children: [
                  RoundedImage(imageUrl: pro.img, isNetworkImage: true),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(onPressed: () {setState(() {DatabaseHelper().deleteproductWithlist(pro.productID);});}, icon: const SquareIcons(width: 40, height: 40,icon: Iconsax.heart5, color: Colors.black, size: 25)),
                  )
                ],
              ),
            ),
            const SizedBox(height: TSize.spaceBtwItem),
            // -- Detail --
            Padding(
            padding: const EdgeInsets.only(left: TSize.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  ProductTitleText(title: pro.name, smallSize: false),
                ],
              ),
            ),
            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Price
                Padding( 
                  padding: const EdgeInsets.only(left: TSize.sm),
                  child: Text(NumberFormat('#,##0').format(pro.price)),
                ),

                ///Add to Cart Button
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSize.cardRadiusMd),
                      bottomRight: Radius.circular(TSize.productImageRadius),
                    ),
                  ),
                  child: SizedBox(
                    width: TSize.iconLg * 1.2,
                    height: TSize.iconLg * 1.2,
                    child: Center(child: IconButton(onPressed: () {}, icon: const Icon(Iconsax.add, color: Colors.white,))),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}