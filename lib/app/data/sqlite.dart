import 'package:flutter_store/app/model/cart.dart';
import 'package:flutter_store/app/model/withlist.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // Singleton pattern
  static final DatabaseHelper _databaseService = DatabaseHelper._internal();
  factory DatabaseHelper() => _databaseService;
  DatabaseHelper._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    //final path = join(databasePath, 'db_cart.db');
    final path2 = join(databasePath, 'db_withlist.db');
    print(
        "Đường dẫn database: $databasePath"); // in đường dẫn chứa file database
    return await openDatabase(path2, onCreate: _onCreate, version: 2);
  }

  Future<void> _onCreate(Database db, int version) async {

    await db.execute(
      'CREATE TABLE Cart('
          'productID INTEGER, name TEXT, price FLOAT, img TEXT, des TEXT, count INTEGER)',
    );

    await db.execute(
      'CREATE TABLE Withlist('
          'productID INTEGER, name TEXT, price FLOAT, img TEXT, des TEXT)',
    );
  }

  Future<void> insertProduct(Cart productModel) async {
    final db = await _databaseService.database;
    var res = await db.rawQuery('SELECT * FROM Cart WHERE productID = "${productModel.productID}"');
    if(res.isEmpty)
    {
      await db.insert(
        'Cart',
        productModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    else
    {
      _databaseService.add(productModel);
    }
  }

  Future<void> insertProductCart(Withlist productModel) async {
    final db = await _databaseService.database;
    var res = await db.rawQuery('SELECT * FROM Cart WHERE productID = "${productModel.productID}"');
    if(res.isEmpty)
    {
      await db.insert(
        'Cart',
        productModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    else
    {
      _databaseService.add(productModel as Cart);
    }
  }

  Future<void> insertProductWithlist(Withlist withlistModel) async {
    final db = await _databaseService.database;
    var res = await db.rawQuery('SELECT * FROM Withlist WHERE productID = "${withlistModel.productID}"');
    if(res.isEmpty)
    {
      await db.insert(
        'Withlist', 
        withlistModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    else
    { }
  }

  Future<List<Withlist>> withlistproducts() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('Withlist');
    return List.generate(
        maps.length, (index) => Withlist.fromMap(maps[index]));
  }
  Future<Withlist> withlistproduct(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
    await db.query('product', where: 'id = ?', whereArgs: [id]);
    return Withlist.fromMap(maps[0]);
  }

  Future<List<Cart>> products() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query('Cart');
    return List.generate(
        maps.length, (index) => Cart.fromMap(maps[index]));
  }
  Future<Cart> product(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
    await db.query('product', where: 'id = ?', whereArgs: [id]);
    return Cart.fromMap(maps[0]);
  }


  Future<void> minus(Cart product) async {
    final db = await _databaseService.database;
    if(product.count  > 1) product.count--;
    await db.update(
      'Cart',
      product.toMap(),
      where: 'productID = ?',
      whereArgs: [product.productID],
    );
  }
  Future<void> add(Cart product) async {
    final db = await _databaseService.database;
    product.count++;
    await db.update(
      'Cart',
      product.toMap(),
      where: 'productID = ?',
      whereArgs: [product.productID],
    );
  }

  Future<void> deleteProduct(int id) async {
    final db = await _databaseService.database;
    await db.delete(
      'Cart',
      where: 'productID = ?',
      whereArgs: [id],
    );
  }
  Future<void> deleteproductWithlist(int id) async {
    final db = await _databaseService.database;
    await db.delete(
      'Withlist',
      where: 'productID = ?',
      whereArgs: [id],
    );
  }
  
  Future<void> clear() async {
    final db = await _databaseService.database;
    await db.delete(
      'Cart',
      where: 'count > 0'
    );
  }
}
