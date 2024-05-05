import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/common/style/shadow.dart';
import 'package:flutter_store/app/config/utils/appbar/appbar.dart';
import 'package:flutter_store/app/config/utils/contatiner/rounded_container.dart';
import 'package:flutter_store/app/config/utils/icon/square_icons.dart';
import 'package:flutter_store/app/config/utils/image_container/rounded_image_container.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/data/api.dart';
import 'package:flutter_store/app/data/sqlite.dart';
import 'package:flutter_store/app/home_page.dart';
import 'package:flutter_store/app/model/cart.dart';
import 'package:flutter_store/app/screen/checkout/widget/success_screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartState();
}

class _CartState extends State<CartScreen> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<List<Cart>> _getProducts() async {
    return await _databaseHelper.products();
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Giỏ hàng', style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: FutureBuilder<List<Cart>>(
          future: _getProducts(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final itemProduct = snapshot.data![index];
                  return _buildProduct(itemProduct, context);
                },
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) => const SizedBox(height: 20),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSize.defaultSpace),
        child: ElevatedButton(onPressed: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            List<Cart> temp = await _databaseHelper.products();
            await APIRepository().addBill(temp, pref.getString('token').toString());
            _databaseHelper.clear();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuccesScreen(
                          image: 'assets/icon/success.png', 
                          title: 'Thanh toán thành công', 
                          subTitle: 'Email xác nhận thông tin đơn hàng đã được gửi mong bạn kiểm tra', 
                          onPressed: () => Get.to(() => const HomePage()))));
          },
          child: const Text('Thanh toán')
        ),
      ),
    );
  }

  Widget _buildProduct(Cart pro, BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: const [ShadowStyle.verticalProductShadow],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                height: 95,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: RoundedImage(imageUrl: pro.img, isNetworkImage: true),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pro.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    NumberFormat('#,##0 ' + 'đ').format(pro.price),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 5,
          right: 11,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 90, top: 7),
                child: RoundedContainer(width: 40, height: 40, showBorder: true, child: IconButton(onPressed: (){setState(() {DatabaseHelper().deleteProduct(pro.productID);});}, icon: const Icon(Iconsax.trash, color: Colors.black, size: 20))),
              ),
              const SizedBox(height: 7),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: (){ setState(() {DatabaseHelper().minus(pro); }); },
                    icon: SquareIcons(
                      icon: Iconsax.minus,
                      width: 30,
                      height: 30,
                      size: TSize.md,
                      color: THelperFunctions.isDarkMode(context) ? Colors.white : Colors.white,
                      backgroundColor: THelperFunctions.isDarkMode(context) ? Colors.black : Colors.black,
                    ),
                  ),
                  const SizedBox(width: TSize.spaceBtwItem),
                  Text('${pro.count}', style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(width: TSize.spaceBtwItem),
                  IconButton(
                    onPressed: (){ setState(() {DatabaseHelper().add(pro); }); },
                    icon: SquareIcons(
                      icon: Iconsax.add,
                      width: 30,
                      height: 30,
                      size: TSize.md,
                      color: THelperFunctions.isDarkMode(context) ? Colors.white : Colors.white,
                      backgroundColor: THelperFunctions.isDarkMode(context) ? Colors.black : Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )],
    );
  }
}

