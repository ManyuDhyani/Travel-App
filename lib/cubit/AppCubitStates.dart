import 'package:bloc/bloc.dart';
import 'package:travel_app/cubit/AppCubites.dart';
import 'package:travel_app/models/ActivityModel.dart';
import 'package:travel_app/services/DataServices.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final activities;

  Future<void> getData() async {
    try {
      emit(LoadingState());
      activities = await data.getInfo();
      emit(LoadedState(activities));
    } catch (e) {
      print(e);
    }
  }

  detailPage(ActivityModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(activities));
  }
}
