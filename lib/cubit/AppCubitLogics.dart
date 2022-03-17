import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/AppCubitStates.dart';
import 'package:travel_app/cubit/AppCubites.dart';
import 'package:travel_app/pages/detailPage.dart';
import 'package:travel_app/pages/navpages/mainPage.dart';
import 'package:travel_app/pages/welcomePage.dart';

class AppCubitLogics extends StatefulWidget {
  AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is DetailState) {
            return DetailPage();
          }
          if (state is WelcomeState) {
            return WelcomePage();
          }
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
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
