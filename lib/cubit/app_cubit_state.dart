import 'package:equatable/equatable.dart';
import 'package:flutter_mastery/model/data_model.dart';

abstract class CubicStates extends Equatable {}

class InitialState extends CubicStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WelcomeState extends CubicStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends CubicStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends CubicStates {
  LoadedState(this.places);

  final List<DataModel> places;

  @override
  // TODO: implement props
  List<Object> get props => [places];
}

class DetailState extends CubicStates {
  DetailState(this.place);

  final DataModel place;

  @override
  // TODO: implement props
  List<Object> get props => [place];
}
