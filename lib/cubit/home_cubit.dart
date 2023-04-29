part of 'home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState()) {}

  // Instances //
  UsersService service = UsersService();
  HomeRepository repository = HomeRepository();

  Future<void> getUsersFromBox() async {
    emit(HomeLoadingstate());
    await repository.openBox();
    if (repository.usersBox!.isNotEmpty && repository.usersBox != null) {
      emit(HomeOfflineState(repository.usersBox!.values.toList()));
    } else {
      getUsersFromBox();
    }
  }

  Future<void> getUsersFromService() async {
    emit(HomeLoadingstate());
    await service.getUsers().then((dynamic response) {
      if (response is List<UsersModel>) {
        emit(HomeOnlineState(response));
      } else {
        emit(HomeErrorState(response));
      }
    });
  }

  final Connectivity _connectivity = Connectivity();
  ConnectivityResult connectivityResult = ConnectivityResult.none;

  checkConnection() {
    _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi ||
          event == ConnectivityResult.mobile) {
        Fluttertoast.showToast(msg: 'You are online');
        getUsersFromService();
      } else {
        Fluttertoast.showToast(msg: 'You are offline');
        getUsersFromBox();
      }
    });
  }
}
