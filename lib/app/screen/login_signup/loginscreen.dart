import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/style/spacing_style.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/data/api.dart';
import 'package:flutter_store/app/home_page.dart';
import 'package:flutter_store/app/screen/login_signup/password_configuration/forget_password.dart';
import 'package:flutter_store/app/screen/login_signup/signupscreen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/sharepre.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() async {
    //lấy token (lưu share_preference)
    String token = await APIRepository()
        .login(accountController.text, passwordController.text);
    var user = await APIRepository().current(token);
    // save share
    saveUser(user);
    //
    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
    return token;
  }

  @override
  void initState() {
    super.initState();
    autoLogin();
  }

  autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user') != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(
                    height: 150,
                    image: AssetImage('assets/logo/store_logo_transparent.png'),
                  ),
                  Text( "Xin chào bạn", style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: TSize.sm),
                  Text("Sản phẩm đa dạng và chất lượng, đảm bảo bạn sẽ có trải nghiệm tốt nhất", style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: TSize.sm),
                ],
              ),

              // Form
              Form(
                child: 
                  Padding(padding: const EdgeInsets.symmetric(vertical: TSize.spaceBtwSection),
                    child: Column(
                      children: [
                        TextFormField(
                            controller: accountController,
                            decoration: const InputDecoration(
                            labelText: "Tài khoản",
                            prefixIcon: Icon(Iconsax.user),
                          ),
                        ),
                        const SizedBox(height: TSize.spaceBtwInputField),

                        TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                            labelText: "Mật khẩu",
                            prefixIcon: Icon(Iconsax.password_check),
                            suffixIcon: Icon(Iconsax.eye_slash)
                          ),
                        ),
                        const SizedBox(height: TSize.spaceBtwInputField / 2),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Remember
                            Row(
                              children: [
                                Checkbox(value: true, onChanged: (value){}),
                                const Text('Ghi nhớ tài khoản')
                              ],
                            ),
                            TextButton(onPressed: () => Get.to(() => const ForgetPassword()), child: const Text('Quên mật khẩu'))
                          ],
                        ),

                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(onPressed: login, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)), child: const Text("Đăng nhập")),
                        ),
                        const SizedBox(height: TSize.spaceBtwItem),

                        // Sign In Button
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(onPressed: () { 
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen())); 
                            },
                            child: const Text('Đăng ký'),
                          ),
                        ),
                      ],
                    ),
                ),
              ),

              // Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(child: Divider(color: Colors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
                  Text('hoặc đăng nhập với', style: Theme.of(context).textTheme.labelMedium),
                  const Flexible(child: Divider(color: Colors.grey, thickness: 0.5, indent: 5, endIndent: 60)),
                ],
              ),
              const SizedBox(height: TSize.spaceBtwSection),

              // Google Facebook
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                      onPressed: (){},
                      icon: const Image(
                        width: TSize.iconMd,
                        height: TSize.iconMd,
                        image: AssetImage('assets/logo/google_logo.png'),
                      ),
                    ),
                  ),

                  const SizedBox(width: TSize.spaceBtwItem),
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        width: TSize.iconMd,
                        height: TSize.iconMd,
                        image: AssetImage('assets/logo/facebook_logo.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
