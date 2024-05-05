import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/common/style/shadow.dart';
import 'package:flutter_store/app/config/utils/appbar/appbar.dart';
import 'package:flutter_store/app/config/utils/constant/enums.dart';
import 'package:flutter_store/app/config/utils/contatiner/rounded_container.dart';
import 'package:flutter_store/app/config/utils/contatiner/search_container.dart';
import 'package:flutter_store/app/config/utils/icon/square_icons.dart';
import 'package:flutter_store/app/config/utils/image_container/rounded_image_container.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/config/utils/widget_text/brands_title_text.dart';
import 'package:flutter_store/app/config/utils/widget_text/product_title_text.dart';
import 'package:flutter_store/app/config/utils/widget_text/section_heading.dart';
import 'package:flutter_store/app/data/api.dart';
import 'package:flutter_store/app/data/sqlite.dart';
import 'package:flutter_store/app/model/cart.dart';
import 'package:flutter_store/app/model/category.dart';
import 'package:flutter_store/app/model/product.dart';
import 'package:flutter_store/app/model/withlist.dart';
import 'package:flutter_store/app/screen/all_cate/all_cate.dart';
import 'package:flutter_store/app/screen/all_cate/cate_product.dart';
import 'package:flutter_store/app/screen/all_product/all_product.dart';
import 'package:flutter_store/app/screen/cart/cart.dart';
import 'package:flutter_store/app/screen/product/widget/cart_icon.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesState();
}

class _CategoriesState extends State<CategoriesScreen> {
  final DatabaseHelper _databaseService = DatabaseHelper();
  bool click = true;
  int id = 0;
  int data  = 0;

  Future<List<ProductModel>> _getProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await APIRepository().getProduct(
      prefs.getString('accountID').toString(),
      prefs.getString('token').toString()
    );
  }

  Future<List<CategoryModel>> _getCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await APIRepository().getCategory(
      prefs.getString('accountID').toString(),
      prefs.getString('token').toString()
    );
  }

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

        return DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: TAppBar(
              title: Text('Danh mục sản phẩm', style: Theme.of(context).textTheme.headlineMedium),
              actions: [
                Padding(padding: const EdgeInsets.only(right: 12) ,child: CartIcon(onPressed: () => Get.to(() => const CartScreen()) , iconColor: Colors.black)),
              ],
            ),

            body: NestedScrollView(
              headerSliverBuilder: (_, innerBoxIsScrolled) {
                return [ 
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: THelperFunctions.isDarkMode(context) ? Colors.black : Colors.white,
                    expandedHeight: 440,
                    
                    flexibleSpace: Padding(
                      padding:const EdgeInsets.all(TSize.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics:const NeverScrollableScrollPhysics(),
                        children: [
                          // -- Search Bar -- 
                          const TSearchContainer(text: 'Nhập tên sản phẩm', showBorder:true, showBackground: false, padding: EdgeInsets.zero),
                          const SizedBox(height: TSize.spaceBtwSection),

                          // -- Featured Brands -- 
                          TSectionHeading(title: 'Các danh mục nổi bật', onPressed: () => Get.to(() => const AllCate())),
                          const SizedBox(height: TSize.spaceBtwItem / 1.5),

                          // -- Categories List --
                          GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 80,
                              mainAxisSpacing: TSize.gridViewSpacing,
                              crossAxisSpacing: TSize.gridViewSpacing,
                            ), 
                            itemBuilder: (context, index) {
                              final itemCate = snapshot.data![index];
                              return _buildCate(itemCate, context); 
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: FutureBuilder<List<ProductModel>>(
                future: _getProducts(), 
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(TSize.defaultSpace),
                        child: Column(
                          children: [
                            // -- Title --
                            TSectionHeading(title: 'Bạn có thể thích', onPressed: () => Get.to(() => const AllProduct())),
                            const SizedBox(height: TSize.spaceBtwItem),
                  
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
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCate(CategoryModel cate, BuildContext context) {
    return GestureDetector(
      onTap: () async {
        int cateID = cate.id;
        Navigator.push(context, MaterialPageRoute(builder: (context) => CateProduct(cate: cateID)));
      },
      child: RoundedContainer(
        padding:const EdgeInsets.all(TSize.sm),
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

            // -- Text -- 
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

  Widget _buildProduct(ProductModel pro, BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector (
      onTap: () {},
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
                  ),
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
}

