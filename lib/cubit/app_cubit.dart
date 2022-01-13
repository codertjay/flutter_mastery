import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mastery/cubit/app_cubit_state.dart';
import 'package:flutter_mastery/model/data_model.dart';
import 'package:flutter_mastery/services/data_services.dart';

class AppCubits extends Cubit<CubicStates> {
  AppCubits({@required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  var places;

  void getData() async {
    try {
      emit(LoadingState());
      var places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {
      print(e);
    }
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() async {
    emit(LoadingState());
    var places = await data.getInfo();
    emit(LoadedState(places));
  }
}
