import 'package:hive/hive.dart';

import '../model/usermodel.dart';

class DBFunction{
  DBFunction.internal();
  //singleton class -> a class which can have only one object
  static DBFunction instance = DBFunction.internal();

  factory DBFunction(){ // factory constructor
    return instance;
  }

  Future<void> userSignUp(User user) async{
    final db = await Hive.openBox<User>('users');
    db.put(user.id,user);
  }

  Future<List<User>> getUser() async{
    final db = await Hive.openBox<User>('users');
    return db.values.toList();
  }
}