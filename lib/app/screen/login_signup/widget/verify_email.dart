
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/screen/checkout/widget/success_screen.dart';
import 'package:flutter_store/app/screen/login_signup/loginscreen.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => Get.offAll(() =>const LoginScreen()), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(image: const AssetImage('assets/logo/store_logo_transparent.png'), width: THelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: TSize.spaceBtwSection),

              // Title & Subtitle
              Text('Xác nhận Email', style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBtwItem),
              Text('support@geministore.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBtwSection),

              // Buttons
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => SuccesScreen(
                image: 'assets/logo/store_logo_transparent.png',
                title: 'Tạo tài khoản thành công',
                subTitle: 'Chúc bạn sẽ có trải nghiệm tốt và tìm được sản phẩm mà bạn mong muốn.',
                onPressed: () => Get.to(() => const LoginScreen()),
              ),), child: const Text('Tiếp tục'))),
              const SizedBox(height: TSize.spaceBtwItem),
              SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: const Text('Gửi lại'))),
            ],
          ),
        ),
      ),
    );
  }
}