import 'package:equatable/equatable.dart';
import 'package:travel_app/models/ActivityModel.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends CubitStates {
  LoadedState(this.activities);
  final List<ActivityModel> activities;
  @override
  // TODO: implement props
  List<Object> get props => [activities];
}
