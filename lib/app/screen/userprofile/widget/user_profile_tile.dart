import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_store/app/model/user.dart';
import 'package:flutter_store/app/screen/userprofile/user_profile_screen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TUserProfileTile extends StatefulWidget {
  const TUserProfileTile({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  State<TUserProfileTile> createState() => _TUserProfileState();
}

class _TUserProfileState extends State<TUserProfileTile> {
  User user = User.userEmpty();
  getDataUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String strUser = pref.getString('user')!;

    user = User.fromJson(jsonDecode(strUser));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    String avatar = 'https://64.media.tumblr.com/1c0a550b6a6b075c35bb0f62e6b14047/580b88b831872a09-e8/s250x400/04b15506e7f9c7e11a3aa86f4373c0acb4ddb9c9.png';

    return ListTile(
      leading: SizedBox(
                child: Column(children: [
                  avatar.length < 5 ? const SizedBox() : CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(
                    avatar)),
                ]),
              ),
      title: Text('${user.fullName}', style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.black)),
      subtitle: Text('customer1@gmail.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.black)),
      trailing: IconButton(onPressed: () => Get.to(() => const UserProfileScreen()), icon: const Icon(Iconsax.edit, color: Colors.black)),
    );
  }
}