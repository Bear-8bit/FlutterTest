import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';

class TTermsandConditionCheckbox extends StatelessWidget {
  const TTermsandConditionCheckbox({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(width: 24, height: 24, child: Checkbox(value: true, onChanged: (value){})),
        const SizedBox(width: TSize.spaceBtwItem),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'Tôi đồng ý', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: 'Quy định bảo mật', style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: Colors.white,
                decoration: TextDecoration.underline,
                decorationColor: dark ? Colors.white : Colors.red,
              )),
              TextSpan(text: 'và', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: 'Điều khoản dịch vụ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: Colors.white,
                decoration: TextDecoration.underline,
                decorationColor: dark ? Colors.white : Colors.red,
              )),
          ]),
        ),  
      ],
    );
  }
}