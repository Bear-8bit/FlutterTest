import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/utils/device/device_utils.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Material(
      color: dark ? Colors.black : Colors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: Colors.black,
        labelColor: dark ? Colors.white : Colors.black,
        unselectedLabelColor: Colors.grey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}