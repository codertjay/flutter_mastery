import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/cubit/app_cubit.dart';
import 'package:flutter_mastery/cubit/app_cubit_state.dart';
import 'package:flutter_mastery/pages/detail_page.dart';
import 'package:flutter_mastery/pages/home_page.dart';
import 'package:flutter_mastery/pages/navpages/main_page.dart';
import 'package:flutter_mastery/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  // const AppCubitLogics({Key? key}) : super(key: key);

  @override
  _AppCubitLogicsState createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubicStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return WelcomePage();
          }
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DetailState) {
            return DetailPage();
          }
          if (state is LoadedState) {
            return MainPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
