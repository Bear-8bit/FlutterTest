import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/appbar/appbar.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/config/utils/widget_text/section_heading.dart';
import 'package:flutter_store/app/data/sharepre.dart';
import 'package:flutter_store/app/model/user.dart';
import 'package:flutter_store/app/screen/cart/cart.dart';
import 'package:flutter_store/app/screen/categories/manage/category_list.dart';
import 'package:flutter_store/app/screen/order/history_screen.dart';
import 'package:flutter_store/app/screen/product/manage/product_list.dart';
import 'package:flutter_store/app/screen/userprofile/user_address.dart';
import 'package:flutter_store/app/screen/userprofile/user_profile_screen.dart';
import 'package:flutter_store/app/screen/userprofile/widget/setting_menu_tile.dart';
import 'package:flutter_store/app/screen/userprofile/widget/user_profile_tile.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSetting extends StatefulWidget {
  const UserSetting({super.key});

  @override
  State<UserSetting> createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  User user = User.userEmpty();
  getDataUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String strUser = pref.getString('user')!;

    user  =  User.fromJson(jsonDecode(strUser));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Column(
              children: [
                // -- TAppbar --
                TAppBar(title: Text('Tài khoản', style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.black))),

                // -- User Profile Card -- 
                TUserProfileTile(onPressed: () => Get.to(() => const UserProfileScreen())),
              ],
            ),

            // -- Body --
            Padding(
              padding: const EdgeInsets.all(TSize.defaultSpace),
              child: Column(
                children: [
                   // -- Account Setting -- 
                  const TSectionHeading(title: 'Cài đặt tài khoản', showActionButton: false),
                  const SizedBox(height: TSize.spaceBtwItem),

                  SettingMenuTile(icon: Iconsax.safe_home, title: 'Địa chỉ', onTap: () => Get.to(() => const UserAddress())),
                  SettingMenuTile(icon: Iconsax.shopping_cart, title: 'Giỏ hàng', onTap: () => Get.to(() => const CartScreen())),
                  SettingMenuTile(icon: Iconsax.bag_tick, title: 'Đơn hàng của bạn', onTap: () => Get.to(() => const HistoryScreen())),
                  SettingMenuTile(icon: Iconsax.bank, title: 'Thông tin ngân hàng', onTap: (){}),
                  SettingMenuTile(icon: Iconsax.discount_shape, title: 'Phiếu giảm giá', onTap: (){}),
                  SettingMenuTile(icon: Iconsax.notification, title: 'Thông báo', onTap: (){}),
                  SettingMenuTile(icon: Iconsax.security_card, title: 'Bảo mật tài khoản', onTap: (){}),
                  SettingMenuTile(icon: Iconsax.shop, title: 'Danh sách sản phẩm', onTap: () => Get.to(() => const ProductList())),
                  SettingMenuTile(icon: Iconsax.category, title: 'Danh sách danh mục', onTap: () => Get.to(() => const CategoryList())),

                  // -- Logout Button --
                  const SizedBox(height: TSize.spaceBtwSection),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: (){logOut(context);}, child: const Text('Đăng xuất')),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

