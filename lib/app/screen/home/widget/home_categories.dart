import 'package:flutter/material.dart';
import 'package:flutter_store/app/config/utils/sizes.dart';
import 'package:flutter_store/app/data/api.dart';
import 'package:flutter_store/app/model/category.dart';
import 'package:flutter_store/app/screen/all_cate/cate_product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class THomeCategories extends StatefulWidget {
  const THomeCategories({
    super.key,
  });

  @override
  State<THomeCategories> createState() => _THomeCategoriesState();
}

class _THomeCategoriesState extends State<THomeCategories> {
  Future<List<CategoryModel>> _getCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await APIRepository().getCategory(prefs.getString('accountID').toString(), prefs.getString('token').toString());
  }

  

  @override
  Widget build(BuildContext context) {
      return FutureBuilder<List<CategoryModel>>(
        future: _getCategories(), 
        builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SizedBox(
          height: 80,
          child: ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) { 
            final itemCategories = snapshot.data![index];
            return _buildCategory(itemCategories, context);
            },
          )
        );
      }
    );
  }

  Widget _buildCategory(CategoryModel cate, BuildContext context) {
    return GestureDetector(
          onTap: () async {
          int cateID = cate.id;
          Navigator.push(context, MaterialPageRoute(builder: (context) => CateProduct(cate: cateID)));
        },
        child: Padding(
        padding: const EdgeInsets.only(right: TSize.spaceBtwItem),
        child: Column(
        children: [
          // Circular Icon
          Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black)
            ),
            child: Center(
                child: Image(image: NetworkImage(cate.imageUrl), fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    ); 
  }
}