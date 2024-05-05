import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/appbar/appbar.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:iconsax/iconsax.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Add new Address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name')),
                const SizedBox(height: TSize.spaceBtwInputField),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone Number')),
                const SizedBox(height: TSize.spaceBtwInputField),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Street'))),
                    const SizedBox(width: TSize.spaceBtwInputField),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Postal Code'))),
                  ],
                ),
                const SizedBox(height: TSize.spaceBtwInputField),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'City'))),
                    const SizedBox(width: TSize.spaceBtwInputField),
                    Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'State'))),
                  ],
                ),
                const SizedBox(height: TSize.spaceBtwInputField),
                TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Country')),
                const SizedBox(height: TSize.defaultSpace),
                SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text('Save'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}