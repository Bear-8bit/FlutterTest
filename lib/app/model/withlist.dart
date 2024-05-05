import 'dart:convert';

class Withlist {
  int productID;
  String name;
  dynamic price;
  String img;
  String des;

  Withlist({
    required this.name, required this.price, required this.img, required this.des, required this.productID,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'img' : img,
      'des' : des,
      'productID': productID,
    };
  }

  factory Withlist.fromMap(Map<String, dynamic> map) {
    return Withlist(
      productID: map['productID'] ?? 0,
      name: map['name'] ?? '',
      price: map['price'] ?? '',
      img: map['img'] ?? '',
      des: map['des'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Withlist.fromJson(String source) =>
      Withlist.fromMap(json.decode(source));

  @override
  String toString() => 'Product(productID: $productID, name: $name, price: $price, img: $img, des: $des)';

}