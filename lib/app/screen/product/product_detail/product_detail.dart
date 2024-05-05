import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/appbar/appbar.dart';
import 'package:flutter_store/app/config/utils/contatiner/rounded_container.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/config/utils/widget_text/product_price_text.dart';
import 'package:flutter_store/app/config/utils/widget_text/section_heading.dart';
import 'package:flutter_store/app/data/api.dart';
import 'package:flutter_store/app/model/category.dart';
import 'package:flutter_store/app/model/product.dart';
import 'package:flutter_store/app/screen/cart/cart.dart';
import 'package:flutter_store/app/screen/product/product_detail/widget/add_to_cart.dart';
import 'package:flutter_store/app/screen/product/product_detail/widget/product_description.dart';
import 'package:flutter_store/app/screen/product/product_detail/widget/product_slider.dart';
import 'package:flutter_store/app/screen/product/product_detail/widget/rating_and_share.dart';
import 'package:flutter_store/app/screen/product/product_review/product_review.dart';
import 'package:flutter_store/app/screen/product/widget/cart_icon.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetail extends StatefulWidget {
  final bool isUpdate;
  final ProductModel? productModel;

  const ProductDetail({super.key, this.isUpdate = false, this.productModel});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  String? selectedCate;
  List<CategoryModel> categorys = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _desController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imgController = TextEditingController();
  final TextEditingController _catIdController = TextEditingController();
  String titleText = "";

    Future<List<ProductModel>> _getProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await APIRepository().getProduct(
      prefs.getString('accountID').toString(),
      prefs.getString('token').toString()
    );
  }

  Future<void> _onDetail() async {
    final name = _nameController.text;
    final des = _desController.text;
    final price = double.parse(_priceController.text);
    final img = _imgController.text;
    final catId = _catIdController.text;
    var pref = await SharedPreferences.getInstance();
    //update
    await APIRepository().updateProduct(
        ProductModel(
            id: widget.productModel!.id,
            name: name,
            imageUrl: img,
            categoryId: int.parse(catId),
            categoryName: '',
            price: price,
            description: des),
        pref.getString('accountID').toString(),
        pref.getString('token').toString());
    setState(() {});
    Navigator.pop(context);
  }

  @override 
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getProducts(), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Scaffold(
          bottomNavigationBar:const AddToCart(),
          // AppBar
          appBar: TAppBar(title: Text('Thông tin sản phẩm', style: Theme.of(context).textTheme.headlineMedium), showBackArrow: true, actions: [Padding(padding: const EdgeInsets.only(right: 12) ,child: CartIcon(onPressed: () => Get.to(() => const CartScreen()) , iconColor: Colors.black)),],),
          body: SingleChildScrollView(
          child: Column(
            children: [
              // 1 - Prooduct Slider
              const TProductSlider(),

              // 2 - Product Details
              Padding(
                padding:const EdgeInsets.only(right: TSize.defaultSpace, left: TSize.defaultSpace, bottom: TSize.defaultSpace),
                child: Column(
                  children: [
                    // Rating & Share Button
                    const TRatingShare(),

                    // Price, Name, Brand
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            RoundedContainer(
                              radius: TSize.sm,
                              backgroundColor: Colors.black.withOpacity(0.8),
                              padding: const EdgeInsets.symmetric(horizontal: TSize.sm, vertical: TSize.xs),
                              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.white)),
                            ),
                            const SizedBox(width: TSize.spaceBtwItem),

                            // Price
                            Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
                            const SizedBox(width: TSize.spaceBtwItem),
                            const ProductPriceText(price: '175', isLarge: true),
                          ],
                        ),
                      ],
                    ),

                    // Description
                    const TSectionHeading(title: 'Chi tiết sản phẩm', showActionButton: false),
                    const SizedBox(height: TSize.spaceBtwItem),
                    const ReadMoreText(
                      'Description',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Xem thêm',
                      trimExpandedText: ' Less',
                      moreStyle: TextStyle(fontSize: 14, fontWeight:FontWeight.w800),
                      lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                    const TProductDescription(),

                    //  Reviews
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TSectionHeading(title: 'Đánh giá (1999)', showActionButton: false),
                          IconButton(onPressed: () => Get.to(() => const ProductReview()), icon: const Icon(Iconsax.arrow_right_3, size: 18)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ); 
      }
    );
  }
}


