import 'package:amelia/src/feature/signup/domain/entity/user.dart';

class UserModel extends User {
  UserModel({required super.id, required super.name, required super.email});

  factory UserModel.fromJSON(Map<String, dynamic> map) {
    return UserModel(id: map['id'], name: map['name'], email: map['email']);
  }
}
