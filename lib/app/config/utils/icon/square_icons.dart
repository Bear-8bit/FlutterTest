import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';

class SquareIcons extends StatelessWidget {
  const SquareIcons({
    super.key,
    this.width, 
    this.height, 
    this.size = TSize.lg, 
    required this.icon, 
    this.color, 
    this.backgroundColor, 
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null ? backgroundColor! : THelperFunctions.isDarkMode(context) ? Colors.black.withOpacity(0.9) : Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(5),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon, color: color, size: size)),
    );
  }
}