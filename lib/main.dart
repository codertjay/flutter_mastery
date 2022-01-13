import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/cubit/app_cubit.dart';
import 'package:flutter_mastery/cubit/app_cubit_logics.dart';
import 'package:flutter_mastery/pages/detail_page.dart';
import 'package:flutter_mastery/pages/navpages/main_page.dart';
import 'package:flutter_mastery/pages/welcome_page.dart';
import 'package:flutter_mastery/services/data_services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Mastery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(data: DataServices()),
        child: AppCubitLogics(),
      ),
    );
  }
}
