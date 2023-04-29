import 'package:_full_blocccccc_project/cubit/home_states.dart';
import 'package:_full_blocccccc_project/data/model/users_model.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text('Users')),
        body: Builder(
          builder: (context) {
            if (state is HomeLoadingstate) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is HomeErrorState) {
              return Center(
                child: Text(state.error.toString()),
              );
            } else if (state is HomeOnlineState) {
              return FadeIn(
                duration: const Duration(seconds: 5),
                child: UsersList(data: state.data),
              );
            } else if (state is HomeOfflineState) {
              return FadeInUp(
                duration: const Duration(seconds: 5),
                child: UsersList(data: state.box),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

class UsersList extends StatelessWidget {
  final List<UsersModel> data;
  const UsersList({super.key, required this.data});

  @override
  ListView build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(data[index].name.toString()),
          subtitle: Text(data[index].company!.name.toString()),
        );
      },
    );
  }
}
