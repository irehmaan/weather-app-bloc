import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String uid;

  @HiveField(1)
  final String? displayName;

  @HiveField(2)
  final String? email;

  UserModel({
    required this.uid,
    this.displayName,
    this.email,
  });
}
