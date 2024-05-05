import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/appbar/appbar.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/config/utils/widget_text/section_heading.dart';
import 'package:flutter_store/app/model/user.dart';
import 'package:flutter_store/app/screen/userprofile/widget/profile_list.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatefulWidget {
  final User? user;
  const UserProfileScreen({super.key, this.user});

  @override
  State<UserProfileScreen> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfileScreen> {
  User user = User.userEmpty();
  getDataUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String strUser = pref.getString('user')!;

    user  =  User.fromJson(jsonDecode(strUser));
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

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Thông tin cá nhân', style: Theme.of(context).textTheme.headlineMedium),
      ),

      // -- Body --
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            children: [
              // -- Profile Picture -- 
              SizedBox(
                width: double.infinity,
                child: Column(children: [
                  avatar.length < 5 ? const SizedBox() : CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                    avatar)),
                  const SizedBox(
                    height: 8,
                  ),
                  TextButton(onPressed: () {}, child: const Text('Thay đổi ảnh đại diện')),
                ]),
              ),

              // -- Detail --
              const SizedBox(height: TSize.spaceBtwItem / 2),
              const Divider(),
              const SizedBox(height: TSize.spaceBtwItem),
              const TSectionHeading(title: 'Thông tin tài khoản', showActionButton: false),
              const SizedBox(height: TSize.spaceBtwItem),

              ProfileList(title: 'Họ tên', value: '${user.fullName}', onPressed: (){}),
              ProfileList(title: 'Mã tài khoản', value: '20DH111928', onPressed: (){}),

              const SizedBox(height: TSize.spaceBtwItem),
              const Divider(),
              const SizedBox(height: TSize.spaceBtwItem),

              // -- Personal Info --
              const TSectionHeading(title: 'Thông tin cá nhân', showActionButton: false),
              const SizedBox(height: TSize.spaceBtwItem),

              ProfileList(title: 'CMND', value: '${user.idNumber}', icon: Iconsax.copy, onPressed: (){}),
              ProfileList(title: 'E-mail', value: 'customer1@gmail.com', onPressed: (){}),
              ProfileList(title: 'Số điện thoại', value: '${user.phoneNumber}', onPressed: (){}),
              ProfileList(title: 'Giới tính', value: '${user.gender}', onPressed: (){}),
              ProfileList(title: 'Ngày sinh', value: '${user.birthDay}', onPressed: (){}),
              const Divider(),
              const SizedBox(height: TSize.spaceBtwItem),

              Center(
                child: TextButton(
                  onPressed: (){},
                  child: const Text('Xóa tài khoản', style: TextStyle(color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

