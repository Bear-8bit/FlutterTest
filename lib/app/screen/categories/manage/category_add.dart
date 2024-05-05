
import 'package:flutter/material.dart';
import 'package:flutter_store/app/data/api.dart';
import 'package:flutter_store/app/model/category.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CategoryAdd extends StatefulWidget {
  final bool isUpdate;
  final CategoryModel? categoryModel;
  const CategoryAdd({super.key, this.isUpdate = false, this.categoryModel});

  @override
  State<CategoryAdd> createState() => _CategoryAddState();
}

class _CategoryAddState extends State<CategoryAdd> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  String titleText = "";
  Future<void> _onSave() async {
    final name = _nameController.text;
    final description = _descController.text;
    final image = _imageController.text;
    var pref = await SharedPreferences.getInstance();
    await APIRepository().addCategory(
        CategoryModel(id: 0, name: name, imageUrl: image, desc: description),
        pref.getString('accountID').toString(),
        pref.getString('token').toString());
    // await _databaseService
    //     .insertCategory(CategoryModel(name: name, desc: description));
    setState(() {});
    Navigator.pop(context);
  }

  Future<void> _onUpdate(int id) async {
    final name = _nameController.text;
    final description = _descController.text;
    final image = _imageController.text;
    var pref = await SharedPreferences.getInstance();

    //update
    await APIRepository().updateCategory(
        id,
        CategoryModel(id: widget.categoryModel!.id, name: name, imageUrl: image, desc: description),
        pref.getString('accountID').toString(),
        pref.getString('token').toString());
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.categoryModel != null && widget.isUpdate) {
      _nameController.text = widget.categoryModel!.name;
      _imageController.text = widget.categoryModel!.imageUrl;
      _descController.text = widget.categoryModel!.desc;
    }
    if (widget.isUpdate) {
      titleText = "Cập nhật danh mục";
    } else {
      titleText = "Thêm danh mục";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(titleText),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
                'Tên danh mục:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nhập têm danh mục',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
                'Hình ảnh:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            
            TextField(
              controller: _imageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nhập dịa chỉ hình',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
                'Mô tả:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            TextField(
              controller: _descController,
              maxLines: 7,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nhập mô tả danh mục',
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  widget.isUpdate
                      ? _onUpdate(widget.categoryModel!.id)
                      : _onSave();
                },
                child: const Text(
                  'Lưu',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
