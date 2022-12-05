
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/constants/strings.dart';

import '../../data/services/dio.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit():super(NewsInitialState());


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
}