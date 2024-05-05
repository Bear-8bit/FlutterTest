import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  //final TextEditingController _accountIDController = TextEditingController();
  //final TextEditingController _numberIDController = TextEditingController();
  //final TextEditingController _newPassController = TextEditingController();

  String temp = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSize.defaultSpace),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Heading
            Text('Quên mật khẩu', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TSize.spaceBtwItem),

            //Text Field
            TextFormField(
              decoration: const InputDecoration(labelText: 'Account ID', prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(height: TSize.spaceBtwSection),
            //Text Field
            TextFormField(
              decoration: const InputDecoration(labelText: 'Number ID', prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(height: TSize.spaceBtwSection),
            //Text Field
            TextFormField(
              decoration: const InputDecoration(labelText: 'New Pass', prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(height: TSize.spaceBtwSection),

            //Submit Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text('Xác nhận'))), 
          ],
        ),
      ),
    );
  }
}