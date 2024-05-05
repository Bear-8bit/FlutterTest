import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key, required this.image, required this.title, this.textColor = Colors.white, this.backgroundColor = Colors.white, this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
        onTap: onTap,
        child: Padding(
        padding: const EdgeInsets.only(right: TSize.spaceBtwItem),
        child: Column(
        children: [
          // Circular Icon
          Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black)
            ),
            child: Center(
              child: Image(image: AssetImage(image), fit: BoxFit.cover),
            ),
          ),
        ],
      ),
      ),
    ); 
  }
}
