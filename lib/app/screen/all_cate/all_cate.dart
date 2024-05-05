import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/appbar/appbar.dart';
import 'package:flutter_store/app/config/utils/constant/enums.dart';
import 'package:flutter_store/app/config/utils/contatiner/rounded_container.dart';
import 'package:flutter_store/app/config/utils/image_container/rounded_image_container.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/config/utils/widget_text/brands_title_text.dart';
import 'package:flutter_store/app/data/api.dart';
import 'package:flutter_store/app/model/category.dart';
import 'package:flutter_store/app/screen/all_cate/cate_product.dart';
import 'package:flutter_store/app/screen/cart/cart.dart';
import 'package:flutter_store/app/screen/product/widget/cart_icon.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllCate extends StatefulWidget {
  const AllCate({super.key});

  @override
  State<AllCate> createState() => _AllCateState();
}

class _AllCateState extends State<AllCate> {

  Future<List<CategoryModel>> _getCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await APIRepository().getCategory(prefs.getString('accountID').toString(), prefs.getString('token').toString());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
      future: _getCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          appBar: TAppBar(
            title: Text('Danh sách thể loại', style: Theme.of(context).textTheme.headlineMedium,), 
            showBackArrow: true,
            actions: [
              Padding(padding: const EdgeInsets.only(right: 12) ,child: CartIcon(onPressed: () => Get.to(() => const CartScreen()) , iconColor: Colors.black)),
            ]
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(TSize.defaultSpace),
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 80,
                          mainAxisSpacing: TSize.gridViewSpacing,
                          crossAxisSpacing: TSize.gridViewSpacing,
                    ),
                    itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final itemProduct = snapshot.data![index];
                          return _buildCategory(itemProduct, context); 
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  Widget _buildCategory(CategoryModel cate, BuildContext context) {
    return GestureDetector(
      onTap: () async {
        int cateID = cate.id;
        Navigator.push(context, MaterialPageRoute(builder: (context) => CateProduct(cate: cateID)));
      },
      child: RoundedContainer(
        padding: const EdgeInsets.all(TSize.sm),
        showBorder: true,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            // -- Image -- 
            RoundedContainer(
              height: 40.0,
              width: 40.0,
              showBorder: true,
              child: RoundedImage(
                isNetworkImage: true,
                imageUrl: cate.imageUrl,
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(width: TSize.spaceBtwItem / 2),
            // --Text--
            Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Row(
                    mainAxisSize: MainAxisSize.min, 
                    children: [
                      Flexible(child: BrandTitleText(title: cate.name, color: Colors.black, brandTextSize: TextSizes.large,)
                    )
                  ]),
                ],
              ),
            ), 
          ],
        ),
      ),
    );
  }
}

