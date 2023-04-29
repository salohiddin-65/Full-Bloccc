import 'package:_full_blocccccc_project/cubit/home_states.dart';
import 'package:_full_blocccccc_project/data/repository/home_repository.dart';
import 'package:_full_blocccccc_project/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main(List<String> args) async {
  HomeRepository.registerAdapters();
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => HomeCubit()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
