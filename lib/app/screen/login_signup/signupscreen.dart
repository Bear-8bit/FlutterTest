
import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/model/register.dart';
import 'package:flutter_store/app/screen/checkout/widget/success_screen.dart';
import 'package:flutter_store/app/screen/login_signup/loginscreen.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../data/api.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _RegisterState();
}

class _RegisterState extends State<SignupScreen> {
  int _gender = 0;
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _numberIDController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _schoolKeyController = TextEditingController();
  final TextEditingController _schoolYearController = TextEditingController();
  final TextEditingController _birthDayController = TextEditingController();
  final TextEditingController _imageURL = TextEditingController();
  String gendername = 'None';
  String temp = '';

  Future<String> register() async {
    return await APIRepository().register(Signup(
        accountID: _accountController.text,
        birthDay: _birthDayController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
        fullName: _fullNameController.text,
        phoneNumber: _phoneNumberController.text,
        schoolKey: _schoolKeyController.text,
        schoolYear: _schoolYearController.text,
        gender: getGender(),
        imageUrl: _imageURL.text,
        numberID: _numberIDController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text('Thông tin đăng ký', style: Theme.of(context).textTheme.headlineMedium),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Form
              Form(
                child: Column(
                  children: [
                    signUpWidget(),
                  ],
                ),
              ),
              const SizedBox(height: TSize.spaceBtwSection),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    String respone = await register();
                    if(respone == 'ok') {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SuccesScreen(
                        image: 'assets/logo/store_logo_transparent.png', 
                        title: 'Tạo tài khoản thành công', 
                        subTitle: 'Chúc bạn sẽ có trải nghiệm tốt và tìm được sản phẩm mà bạn mong muốn.', 
                        onPressed: () => Get.to(() => const LoginScreen()))));
                    }
                    else {
                      print(respone);
                    }
                  },
                  child: const Text('Tạo tài khoản'),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  getGender() {
    if (_gender == 1) {
      return "Male";
    } else if (_gender == 2) {
      return "Female";
    }
    return "Other";
  }

  //có thể thêm các biến cho phù hợp với từng field
  Widget textField(
      TextEditingController controller, String label, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: label.contains('word'),
        onChanged: (value) {
          setState(() {
            temp = value;
          });
        },
        decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(icon),
            border: const OutlineInputBorder(),
            focusedErrorBorder: controller.text.isEmpty
                ? const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))
                : null,
            errorBorder: controller.text.isEmpty
                ? const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))
                : null),
      ),
    );
  }

  Widget signUpWidget() {
    return Column(
      children: [
        Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _accountController,
                  expands: false,
                  decoration: const InputDecoration(labelText: 'ID tài khoản', prefixIcon: Icon(Iconsax.user)),
                  
                ),
              ),
              const SizedBox(width: TSize.spaceBtwInputField),
              Expanded(
                child: TextFormField(
                  controller: _fullNameController,
                  expands: false,
                  decoration: const InputDecoration(labelText: 'Họ tên', prefixIcon: Icon(Iconsax.text)),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSize.spaceBtwInputField),
        textField(_passwordController, "Mật khẩu", Iconsax.password_check),
        textField(
          _confirmPasswordController,
          "Xác nhận mật khẩu",
          Iconsax.lock,
        ),
        textField(_numberIDController, "Số CMND", Iconsax.key),
        textField(_phoneNumberController, "Số điện thoại", Iconsax.mobile),
        textField(_birthDayController, "Ngày sinh", Iconsax.calendar),
        textField(_schoolYearController, "Niên khóa", Iconsax.book),
        textField(_schoolKeyController, "Khóa học", Iconsax.timer_start),
        const Text("Giới tính của bạn"),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: const Text("Nam"),
                leading: Transform.translate(
                    offset: const Offset(16, 0),
                    child: Radio(
                      value: 1,
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    )),
              ),
            ),
            Expanded(
              child: ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: const Text("Nữ"),
                  leading: Transform.translate(
                    offset: const Offset(16, 0),
                    child: Radio(
                      value: 2,
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                  )),
            ),
            Expanded(
                child: ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: const Text("Khác"),
              leading: Transform.translate(
                  offset: const Offset(16, 0),
                  child: Radio(
                    value: 3,
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  )),
            )),
          ],
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _imageURL,
          decoration: const InputDecoration(
            labelText: "Địa chỉ hình",
            prefixIcon: Icon(Iconsax.picture_frame),
          ),
        ),
      ],
    );
  }
}
