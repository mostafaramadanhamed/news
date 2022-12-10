import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news/constants/strings.dart';
import 'package:news/presentation/screens/business.dart';
import 'package:news/presentation/screens/science.dart';
import 'package:news/presentation/screens/sports.dart';
import 'package:news/presentation/screens/top_news.dart';

import '../../data/services/dio.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit():super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems =
  [
   const BottomNavigationBarItem(
      icon: Icon(
       FontAwesomeIcons.house,
      ),
      label: 'Top news',
    ),
   const BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.briefcase,
      ),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.futbol,
      ),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        FontAwesomeIcons.vial,
      ),
      label: 'Science',
    ),
  ];

  List<Widget> screens =
  [
    const TopHeadScreen(),
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  void changeBottomNavBar(int index)
  {
    currentIndex = index;
    if(index == 1) {
      getBusiness();
    }
    if(index == 2) {
      getSports();
    }
    if(index == 3) {
      getScience();
    }
    emit(NewsBottomNavState());
  }


  List<dynamic> topHead = [];

  void getTopHead()
  {
    emit(NewsLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'apiKey':MyStrings.apiKey,
      },
    ).then((value)
    {
      topHead = value.data['articles'];
      print(topHead[0]['title']);

      emit(TopNewsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(TopNewsFailureState(error.toString()));
    });
  }
  List<dynamic> business = [];

  void getBusiness()
  {
    emit(NewsLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'business',
        'apiKey':MyStrings.apiKey,
      },
    ).then((value)
    {
      business = value.data['articles'];
      print(business[0]['title']);

      emit(BusinessNewsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(BusinessNewsFailureState(error.toString()));
    });
  }
  List<dynamic> sports = [];

  void getSports()
  {
    emit(NewsLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'sports',
        'apiKey':MyStrings.apiKey,
      },
    ).then((value)
    {
      sports = value.data['articles'];
      print(sports[0]['title']);

      emit(SportsNewsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SportsNewsFailureState(error.toString()));
    });
  }

  List<dynamic> science = [];

  void getScience()
  {
    emit(NewsLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'eg',
        'category':'science',
        'apiKey':MyStrings.apiKey,
      },
    ).then((value)
    {
      science = value.data['articles'];
      print(science[0]['title']);

      emit(SciencesNewsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SciencesNewsFailureState(error.toString()));
    });
  }

  List<dynamic> search = [];

  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query:
      {
        'q':'$value',
        'apiKey':MyStrings.apiKey,
      },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      // print(search[0]['title']);

      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      // print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }


}