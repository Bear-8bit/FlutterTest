
import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/common/helpers/helper_function.dart';
import 'package:flutter_store/app/config/common/style/shadow.dart';
import 'package:flutter_store/app/config/utils/contatiner/rounded_container.dart';
import 'package:flutter_store/app/config/utils/image_container/rounded_image_container.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/data/api.dart';
import 'package:flutter_store/app/model/category.dart';
import 'package:flutter_store/app/screen/categories/manage/category_add.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CategoryBuilder extends StatefulWidget {
  const CategoryBuilder({Key? key}) : super(key: key);

  @override
  State<CategoryBuilder> createState() => _CategoryBuilderState();
}

class _CategoryBuilderState extends State<CategoryBuilder> {

  Future<List<CategoryModel>> _getCategorys() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await APIRepository().getCategory(prefs.getString('accountID').toString(), prefs.getString('token').toString());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
      future:  _getCategorys(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: ListView.separated(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final itemCat = snapshot.data![index];
              return _buildCategory(itemCat, context);
            }, separatorBuilder: (context, index) => const SizedBox(height: 13),
          ),
        );
      },
    );
  }

  Widget _buildCategory(CategoryModel breed, BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: const [ShadowStyle.horizontalProductShadow],
          borderRadius: BorderRadius.circular(TSize.productImageRadius),
          color: dark ? Colors.black : Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            RoundedContainer(
              height: 40.0,
              width: 40.0,
              showBorder: true,
              child: RoundedImage(
                isNetworkImage: true,
                imageUrl: breed.imageUrl,
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    breed.name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () async {
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  setState(() async {
                    await  APIRepository().removeCategory(breed.id, pref.getString('accountID').toString() , pref.getString('token').toString());
                  });
                },
                icon: const Icon(
                  Iconsax.trash,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context)
                        .push(
                          MaterialPageRoute(
                            builder: (_) => CategoryAdd(
                              isUpdate: true,
                              categoryModel: breed,
                            ),
                            fullscreenDialog: true,
                          ),
                        )
                        .then((_) => setState(() {}));
                  });
                },
                icon: const Icon(
                  Iconsax.edit,
                  color: Colors.black,
                ))
          ],
        ),
      ),
    );
  }
}
