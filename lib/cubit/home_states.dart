import 'package:_full_blocccccc_project/data/model/users_model.dart';
import 'package:_full_blocccccc_project/data/repository/home_repository.dart';
import 'package:_full_blocccccc_project/data/service/get_users_service.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
part 'home_cubit.dart';

abstract class HomeState {
  HomeState();
}

class HomeInitialState extends HomeState {
  HomeInitialState();
}

class HomeLoadingstate extends HomeState {
  HomeLoadingstate();
}

class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState(this.error);
}

class HomeOfflineState extends HomeState {
  List<UsersModel> box;
  HomeOfflineState(this.box);
}

class HomeOnlineState extends HomeState {
  List<UsersModel> data;
  HomeOnlineState(this.data);
}
