import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';

class TSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: TSize.appBarHeight,
    left: TSize.defaultSpace,
    bottom: TSize.defaultSpace,
    right: TSize.defaultSpace,
  );
}