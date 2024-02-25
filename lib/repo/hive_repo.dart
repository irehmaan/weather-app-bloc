import 'package:hive/hive.dart';
import 'package:weatherapp/model/user_model.dart';

class HiveRepository {
  static const _userBoxKey = 'userBox';
  static const _userKey = 'user'; 

  Future<void> saveUser(UserModel user) async {
    final box = await Hive.openBox<UserModel>(_userBoxKey);
    await box.put(_userKey, user); 
  }

  Future<UserModel?> getUser() async {
    final box = await Hive.openBox<UserModel>(_userBoxKey);
    return box.get(_userKey); 
  }

  Future<void> deleteUser() async {
    final box = await Hive.openBox<UserModel>(_userBoxKey);
    await box.delete(_userKey); 
  }
}
