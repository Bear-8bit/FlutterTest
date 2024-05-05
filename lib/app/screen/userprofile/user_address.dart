import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/appbar/appbar.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/screen/userprofile/widget/a_ddress.dart';
import 'package:flutter_store/app/screen/userprofile/widget/add_address.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddress extends StatelessWidget {
  const UserAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () => Get.to(() => const AddAddress()),
        child: const Icon(Iconsax.add, color: Colors.white),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Địa chỉ giao hàng', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              TA_ddress(selectAddress: true),
              TA_ddress(selectAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}