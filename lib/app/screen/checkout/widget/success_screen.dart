import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/common/style/spacing_style.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';

class SuccesScreen extends StatelessWidget {
  const SuccesScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              Image(
                image: AssetImage(image),
                width: THelperFunctions.screenWidth() * 1,
              ),
              const SizedBox(height: TSize.spaceBtwSection),

              // Title & SubTitle
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBtwItem),
              Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBtwSection),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: onPressed, child: const Text('Quay về trang chủ')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}