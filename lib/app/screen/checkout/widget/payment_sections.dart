import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/utils/contatiner/rounded_container.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/config/utils/widget_text/section_heading.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: () {}),
        const SizedBox(height: TSize.spaceBtwItem / 2),
        Row(
          children: [
            RoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? Colors.black : Colors.white,
              padding: const EdgeInsets.all(TSize.sm),
              child: const Image(image: AssetImage('assets/logo/store_logo_transparent.png'), fit: BoxFit.contain),
            ),
            const SizedBox(height: TSize.spaceBtwItem / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}