import 'dart:io';
import 'package:_full_blocccccc_project/data/model/users_model.dart';
import 'package:_full_blocccccc_project/data/service/get_users_service.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HomeRepository {
  // Box //
  Box<UsersModel>? usersBox;

  UsersService service = UsersService();

  Future<dynamic> getUsers() async {
    return await service.getUsers().then((dynamic response) {
      if (response is List<UsersModel>) {}
    });
  }

  // openBox //
  Future<void> openBox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    usersBox = await Hive.openBox('usersBox');
  }

  // putToBox //
  Future<void> putToBox(List<UsersModel> users) async {
    await usersBox!.clear();
    for (int i = 0; i < users.length; i++) {
      await usersBox!.add(users[i]);
    }
  }

  // registerAdapters //
  static void registerAdapters() {
    Hive.registerAdapter(UsersModelAdapter());
    Hive.registerAdapter(AddressAdapter());
    Hive.registerAdapter(GeoAdapter());
    Hive.registerAdapter(CompanyAdapter());
  }
}
