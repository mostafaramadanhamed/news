import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/business/cubit/news_cubit.dart';
import 'package:news/constants/strings.dart';
import 'package:news/presentation/screens/home_page.dart';


class AppRouter{

  late NewsCubit newsCubit;
  AppRouter(){
newsCubit=NewsCubit();
  }
  Route ? generateRoute(RouteSettings settings){
    switch (settings.name){
      case MyStrings.newScreen:
        return MaterialPageRoute(builder: (_)=>  BlocProvider(
          create:(BuildContext context)=>
         newsCubit,
          child: const HomeScreen(),
        ));
    }
  }
}