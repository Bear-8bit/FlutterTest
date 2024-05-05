import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.border,
    this.padding,
    this.onPressed,
    this.width,
    this.height,
    this.applyImageRadius = true,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.backgroundColor = Colors.white,
    this.isNetworkImage = false,
    this.borderRadius = TSize.sm,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
        onTap: onPressed,
        child:  Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(border: border, color: backgroundColor, borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
          borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          child: AspectRatio(aspectRatio: 0.9 ,child: Image(fit: fit, image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider)),
        ),
      ),
    );
  }
}