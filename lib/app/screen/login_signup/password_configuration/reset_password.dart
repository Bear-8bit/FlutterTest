import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              //Image with 60% of screen width
              Image(image:const AssetImage('assets/logo/store_logo_transparent.png'), width: THelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: TSize.spaceBtwSection),

              //Title & Subtile
              Text('Đã gửi email xác nhận', style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBtwItem),
              Text('Nếu như sau 3-4 giây vẫn chưa có email xác nhận xin hãy kiểm tra trong hộp thư rác hoặc nhấn gửi lại email', style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBtwSection),

              //Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {}, child: const Text('Xác nhận')),
              ),
              const SizedBox(height: TSize.spaceBtwItem),
              SizedBox (
                width: double.infinity,
                child: TextButton(onPressed: (){}, child: const Text('Gửi lại Email')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}