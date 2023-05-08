import 'package:hive/hive.dart';
import 'package:samplefeb/storage/Login%20using%20hive/model/usermodel.dart';

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
}