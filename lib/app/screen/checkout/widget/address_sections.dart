import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/config/utils/widget_text/section_heading.dart';

class AddressSections extends StatelessWidget {
  const AddressSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: (){}),
        Text('Customer 1', style: Theme.of(context).textTheme.bodyLarge),

        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: TSize.spaceBtwItem),
            Text('+92-316-2324335', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSize.spaceBtwItem / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: TSize.spaceBtwItem),
            Text('New York City', style: Theme.of(context).textTheme.bodyMedium, softWrap: true),
          ],
        ),
        const SizedBox(height: TSize.spaceBtwItem / 2),
      ],
    );
  }
}