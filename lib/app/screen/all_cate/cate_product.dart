import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/common/style/shadow.dart';
import 'package:flutter_store/app/config/utils/appbar/appbar.dart';
import 'package:flutter_store/app/config/utils/contatiner/rounded_container.dart';
import 'package:flutter_store/app/config/utils/icon/square_icons.dart';
import 'package:flutter_store/app/config/utils/image_container/rounded_image_container.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/config/utils/widget_text/product_title_text.dart';
import 'package:flutter_store/app/data/api.dart';
import 'package:flutter_store/app/data/sqlite.dart';
import 'package:flutter_store/app/model/cart.dart';
import 'package:flutter_store/app/model/product.dart';
import 'package:flutter_store/app/model/withlist.dart';
import 'package:flutter_store/app/screen/cart/cart.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../product/widget/cart_icon.dart';

class CateProduct extends StatefulWidget {
  const CateProduct({super.key, required this.cate});

  final int cate;

  @override
  State<CateProduct> createState() => _CateProductState();
}

class _CateProductState extends State<CateProduct> {
  final DatabaseHelper _databaseService = DatabaseHelper();
  bool click = true;
  int id = 0;
  int cateid = 0;

  Future<void> _saveWithlist(ProductModel pro) async {
    _databaseService.insertProductWithlist(Withlist(
      productID: pro.id,
      name: pro.name, 
      price: pro.price, 
      img: pro.imageUrl, 
      des: pro.description,));
    setState(() {});
  }

  Future<void> _onSave(ProductModel pro) async {
    _databaseService.insertProduct(Cart(
        productID: pro.id,
        name: pro.name,
        des: pro.description,
        price: pro.price,
        img: pro.imageUrl,
        count: 1));
    setState(() {});
  }

  Future<List<ProductModel>> _getCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await APIRepository().getProductByCateID(prefs.getString('accountID').toString(), prefs.getString('token').toString(), widget.cate);
  }

  Future<List<ProductModel>> _getProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await APIRepository().getProductByCateID(
      prefs.getString('accountID').toString(),
      prefs.getString('token').toString(),
      widget.cate
    );
  }

  @override 
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: _getCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final itemProduct = snapshot.data![0];
        return _buildCate(itemProduct ,context);
      },
    );
  }

  Widget _buildProduct(ProductModel pro, BuildContext context) {
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
                  RoundedImage(imageUrl: pro.imageUrl, isNetworkImage: true),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(onPressed: () async {_saveWithlist(pro); setState(() {
                      click = !click;
                      id = pro.id;
                    });}, icon: (id == pro.id) && (click == false) ? const SquareIcons(width: 40, height: 40, icon: Iconsax.heart5, color: Colors.black, size: 25) : const SquareIcons(width: 40, height: 40, icon: Iconsax.heart, color: Colors.black, size: 25)
                    ),
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
                    child: Center(child: IconButton(onPressed: () async {_onSave(pro);}, icon: const Icon(Iconsax.add, color: Colors.white,))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCate(ProductModel pro, BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: _getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return  Scaffold(
        appBar: TAppBar(
          title: Text(pro.categoryName, style: Theme.of(context).textTheme.headlineMedium,), 
          showBackArrow: true,
          actions: [
              Padding(padding: const EdgeInsets.only(right: 12) ,child: CartIcon(onPressed: () => Get.to(() => const CartScreen()) , iconColor: Colors.black)),
            ],
          ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSize.defaultSpace),
            child: Column(
              children: [
                Column(
                  children: [
                    DropdownButtonFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                      onChanged: (value) {},
                      items: ['Tên', 'Giá tăng dần', 'Giá giảm dần', 'Khuyến mãi', 'Mới nhất', 'Mua nhiều']
                            .map((option) => DropdownMenuItem(value: option, child: Text(option)))
                            .toList(),
                    ),
                    const SizedBox(height: TSize.spaceBtwSection),

                      // -- Product --
                      GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 278,
                          mainAxisSpacing: TSize.gridViewSpacing,
                          crossAxisSpacing: TSize.gridViewSpacing,
                        ), 
                        itemBuilder: (context, index) {
                          final itemProduct = snapshot.data![index];
                          return _buildProduct(itemProduct, context); 
                        }
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}