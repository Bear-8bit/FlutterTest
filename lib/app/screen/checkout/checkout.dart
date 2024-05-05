import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/utils/appbar/appbar.dart';
import 'package:flutter_store/app/config/utils/contatiner/rounded_container.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/home_page.dart';
import 'package:flutter_store/app/screen/cart/widget/coupon_widget.dart';
import 'package:flutter_store/app/screen/checkout/widget/address_sections.dart';
import 'package:flutter_store/app/screen/checkout/widget/billing_section.dart';
import 'package:flutter_store/app/screen/checkout/widget/cart_items_checkout.dart';
import 'package:flutter_store/app/screen/checkout/widget/payment_sections.dart';
import 'package:flutter_store/app/screen/checkout/widget/success_screen.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override 
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              // Item in Cart
              const TCarttItems(QuantityButton: false),
              const SizedBox(height: TSize.spaceBtwSection),

              // Coupon 
              const TCounpon(),
              const SizedBox(height: TSize.spaceBtwSection),

              // Billing Sections
              RoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSize.md),
                backgroundColor: dark ? Colors.black : Colors.white,
                child: const Column(
                  children: [
                    // Price
                    BillingSection(),
                    SizedBox(height: TSize.spaceBtwItem),

                    // Divider
                    Divider(),
                    SizedBox(height: TSize.spaceBtwItem),

                    // Payment Method
                    PaymentSection(),
                    SizedBox(height: TSize.spaceBtwItem),

                    // Address
                    AddressSections(),
                    SizedBox(height: TSize.spaceBtwItem),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSize.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(
          () => SuccesScreen(
            image: 'assets/logo/store_logo_transparent.png',
            title: 'Payment Success',
            subTitle: 'Your item will be shipped soon',
            onPressed: () => Get.offAll(() => const HomePage()),
          )), 
        child: const Text('Checkout \$256')),
      ),
    );
  }
}

