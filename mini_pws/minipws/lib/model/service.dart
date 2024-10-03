import 'package:hive/hive.dart';
import 'package:minipws/model/productDb.dart';

class Servicess {
final String  _boxName = "productBox";

Future<Box<Product>> get _box async =>
      await Hive.openBox<Product>(_boxName);

//create
  Future<void> addPerson(Product personModel) async {
    var box = await _box;
    await box.add(personModel);
  }

//read
  Future<List<Product>> getAllPerson() async {
    var box = await _box;
    return box.values.toList();
  }

//update
  Future<void> updateDeck(int index, Product personModel) async { 
    var box = await _box;
    await box.putAt(index, personModel);
  }

//delete
  Future<void> deletePerson(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }
}