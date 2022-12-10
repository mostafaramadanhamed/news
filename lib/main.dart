import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/app_router.dart';
import 'package:news/presentation/screens/home_page.dart';

import 'business/cubit/news_cubit.dart';

void main() {
  runApp( MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({Key? key,required this.appRouter}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
          ..getTopHead()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       home: HomeScreen(),
      ),
    );
  }
}
