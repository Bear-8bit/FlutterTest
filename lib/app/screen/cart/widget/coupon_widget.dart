import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/utils/contatiner/rounded_container.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';

class TCounpon extends StatelessWidget {
  const TCounpon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return RoundedContainer(
      showBorder: true,
      backgroundColor: dark ? Colors.black : Colors.white,
      padding: const EdgeInsets.only(top: TSize.sm, bottom: TSize.sm, right: TSize.sm, left: TSize.md),
      child: Row(
        children: [
          // Text Field
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code ? Enter here ',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
    
          // Button
          SizedBox(width: 80, 
          child: ElevatedButton(
            onPressed: () {}, 
            style: ElevatedButton.styleFrom(
              foregroundColor: dark ? Colors.white.withOpacity(0.5) : Colors.black.withOpacity(0.5),
              backgroundColor: Colors.grey.withOpacity(0.2),
              side: BorderSide(color: Colors.grey.withOpacity(0.1)),
            ),
            child: const Text('Apply'),
            )
          ),
        ],
      ),
    );
  }
}